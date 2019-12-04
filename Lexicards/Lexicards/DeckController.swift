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

    var deck: Deck?

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

    private func layout() {
        guard let deck = self.deck else {
            return
        }

        infoBackground.layer.cornerRadius = 12
        colorView.layer.cornerRadius = colorView.frame.size.height / 2
        colorView.layer.borderColor = UIColor.black.cgColor
        colorView.layer.borderWidth = 2

        nameLabel.text = deck.name
        colorView.backgroundColor = deck.color.backgroundColor
        roundCountLabel.text = String(deck.cumulativeRoundCount)
        let formattedCumulativePercentCorrect = Double(round(1000 * deck.cumulativePercentCorrect) / 10)
        let formattedPercentCorrect = Double(round(1000 * deck.percentCorrect) / 10)
        averageCorrectLabel.text = "\(formattedCumulativePercentCorrect)%"
        lastRoundLabel.text = "\(formattedPercentCorrect)%"

        playButton.layer.cornerRadius = 12
    }

    // MARK: - Actions

    @IBAction func backTapped(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func playTapped(_ sender: AnyObject) {
        
    }

}
