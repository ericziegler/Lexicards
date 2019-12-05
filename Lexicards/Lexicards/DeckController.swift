//
//  DeckController.swift
//  Lexicards
//
//  Created by Eric Ziegler on 12/4/19.
//  Copyright © 2019 Zigabytes. All rights reserved.
//

import UIKit

// MARK: - Constants

let DeckControllerId = "DeckControllerId"

class DeckController: BaseViewController {

    // MARK: - Properties

    @IBOutlet var headerView: UIView!
    @IBOutlet var bodyView: UIView!
    @IBOutlet var headerLabel: BoldLabel!
    @IBOutlet var infoBackground: UIView!
    @IBOutlet var nameLabel: BoldLabel!
    @IBOutlet var colorView: UIView!
    @IBOutlet var roundCountLabel: RegularLabel!
    @IBOutlet var averageCorrectLabel: RegularLabel!
    @IBOutlet var lastRoundLabel: RegularLabel!
    @IBOutlet var playButton: BoldButton!

    var deck: Deck!

    // MARK: - Init

    static func createControllerFor(deck: Deck) -> DeckController {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: DeckController = storyboard.instantiateViewController(withIdentifier: DeckControllerId) as! DeckController
        viewController.deck = deck
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateStats()
    }

    private func layout() {
        infoBackground.layer.cornerRadius = 12
        colorView.layer.cornerRadius = colorView.frame.size.height / 2
        colorView.layer.borderColor = UIColor.darkGray.cgColor
        colorView.layer.borderWidth = 1

        nameLabel.text = deck.name
        colorView.backgroundColor = deck.color.backgroundColor

        updateStats()

        playButton.layer.cornerRadius = 12
    }

    private func updateStats() {
        roundCountLabel.text = String(deck.cumulativeRoundCount)
        let formattedCumulativePercentCorrect = Double(round(1000 * deck.cumulativePercentCorrect) / 10)
        let formattedPercentCorrect = Double(round(1000 * deck.percentCorrect) / 10)
        averageCorrectLabel.text = "\(formattedCumulativePercentCorrect)%"
        lastRoundLabel.text = "\(formattedPercentCorrect)%"
    }

    // MARK: - Actions

    @IBAction func backTapped(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func editTapped(_ sender: AnyObject) {
        print("EDIT TAPPED")
    }

    @IBAction func playTapped(_ sender: AnyObject) {
        let controller = CardController.createControllerFor(deck: deck)
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }

}


extension DeckController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deck.cardCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let card = deck.cards[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CardListCellId, for: indexPath) as! CardListCell
        cell.layoutFor(card: card)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CardListCellHeight
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.createTableHeaderWith(title: "Deck Cards", tableView: tableView, bgColor: UIColor(hex: 0xdddddd), titleColor: UIColor(hex: 0x343434), font: UIFont.applicationBoldFontOfSize(20))
    }

}
