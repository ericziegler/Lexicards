//
//  CardController.swift
//  Lexicards
//
//  Created by Eric Ziegler on 12/5/19.
//  Copyright © 2019 Zigabytes. All rights reserved.
//

import UIKit

// MARK: - Constants

let CardControllerId = "CardControllerId"

class CardController: BaseViewController {

    // MARK: - Properties

    @IBOutlet var headerView: UIView!
    @IBOutlet var bodyView: UIView!
    @IBOutlet var headerLabel: BoldLabel!
    @IBOutlet var cardTable: UITableView!

    var deck: Deck!
    var randomCards = [Card]()
    var completedCount = 0
    var correctCount: Int {
        var result = 0
        for curCard in deck.cards {
            if curCard.status == .correct {
                result += 1
            }
        }
        return result
    }

    // MARK: -  Init

    static func createControllerFor(deck: Deck) -> CardController {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: CardController = storyboard.instantiateViewController(withIdentifier: CardControllerId) as! CardController
        viewController.deck = deck
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateHeaderLabel()
        loadCards()
    }

    private func loadCards() {
        var cardsAddedCount = 0
        while (cardsAddedCount < deck.cardCount) {
            var index = Int.random(in: 0 ... deck.cardCount - 1)
            var card = deck.cards[index]
            while randomCards.contains(card) {
                index = Int.random(in: 0 ... deck.cardCount - 1)
                card = deck.cards[index]
            }
            card.status = .none
            randomCards.append(card)
            cardsAddedCount += 1
        }
    }

    private func updateHeaderLabel() {
        headerLabel.text = "Completed: \(completedCount) of \(deck.cardCount)"
    }

}

extension CardController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return randomCards.count
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CardCellId, for: indexPath) as! CardCell
            cell.card = randomCards[indexPath.row]
            cell.delegate = self
            cell.layoutCard()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FinishCellId, for: indexPath) as! FinishCell
            cell.delegate = self
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CardCellHeight
        } else {
            return FinishCellHeight
        }
    }

}

extension CardController: CardCellDelegate {

    func cardCellDidAnswer(cardCell: CardCell) {
        completedCount += 1
        updateHeaderLabel()
    }

}

extension CardController: FinishCellDelegate {

    func finishCellCompleteTapped(finishCell: FinishCell) {
        if completedCount == deck.cardCount {
            for curCard in deck.cards {
                if curCard.status == .correct {
                    deck.correctCount += 1
                }
            }
            deck.cumulativeCorrectCount += correctCount
            deck.cumulativeRoundCount += 1
            deck.cumulativeCardCount += deck.cardCount
            DeckList.shared.saveDecks()
            let alert = AlertView.createAlertFor(parentController: self, title: "Completed!", message: "You answered \(correctCount) out of \(deck.cardCount) cards correctly.", buttonTitle: ContinueTitle)
            alert.delegate = self
            alert.showAlert()
        } else {
            let alert = AlertView.createAlertFor(parentController: self, title: "Incomplete!", message: "You must answer all cards before completing the deck.", buttonTitle: OKTitle)
            alert.delegate = self
            alert.showAlert()
        }
    }

}

extension CardController: AlertViewDelegate {
    func okTappedForAlertView(alertView: AlertView) {
        self.dismiss(animated: true, completion: nil)
    }
}
