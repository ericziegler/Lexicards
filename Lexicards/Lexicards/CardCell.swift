//
//  CardCell.swift
//  Lexicards
//
//  Created by Eric Ziegler on 12/5/19.
//  Copyright © 2019 Zigabytes. All rights reserved.
//

import UIKit

// MARK: - Constants

let CardCellId = "CardCellId"
let CardCellHeight: CGFloat = 155

// MARK: - Protocols

protocol CardCellDelegate {
    func cardCellDidAnswer(cardCell: CardCell)
}

class CardCell: UITableViewCell {

    // MARK: - Properties

    @IBOutlet var cardView: UIView!
    @IBOutlet var questionLabel: BoldLabel!
    @IBOutlet var answerLabel: BoldLabel!
    @IBOutlet var correctButton: UIButton!
    @IBOutlet var incorrectButton: UIButton!
    @IBOutlet var revealButton: BoldButton!

    var delegate: CardCellDelegate?
    var card: Card!

    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 12
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        answerLabel.textColor = UIColor.gray
        correctButton.isHidden = true
        incorrectButton.isHidden = true
        revealButton.isHidden = false
    }

    // MARK: - Layout

    func layoutCard() {
        questionLabel.text = card.question
        answerLabel.text = card.answer
        correctButton.isHidden = !revealButton.isHidden
        incorrectButton.isHidden = !revealButton.isHidden
        if card.status == .correct {
            revealButton.isHidden = true
            answerLabel.textColor = UIColor(hex: 0x45c17c)
            correctButton.isHidden = true
            incorrectButton.isHidden = true
        }
        else if card.status == .incorrect {
            revealButton.isHidden = true
            answerLabel.textColor = UIColor(hex: 0xf2192e)
            correctButton.isHidden = true
            incorrectButton.isHidden = true
        }
    }

    // MARK: - Actions

    @IBAction func correctTapped(_ sender: AnyObject) {
        card.status = .correct
        layoutCard()
        delegate?.cardCellDidAnswer(cardCell: self)
    }

    @IBAction func incorrectTapped(_ sender: AnyObject) {
        card.status = .incorrect
        layoutCard()
        delegate?.cardCellDidAnswer(cardCell: self)
    }

    @IBAction func revealTapped(_ sender: AnyObject) {
        revealButton.isHidden = true
        layoutCard()
    }

}
