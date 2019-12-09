//
//  DeckListCell.swift
//  Lexicards
//
//  Created by Eric Ziegler on 12/3/19.
//  Copyright © 2019 Zigabytes. All rights reserved.
//

import UIKit

// MARK: - Constants

let DeckListCellId = "DeckListCellId"
let DeckListCellHeight: CGFloat = 75

class DeckListCell: UITableViewCell {

    // MARK: - Properties

    @IBOutlet var colorView: GradientView!
    @IBOutlet var nameLabel: BoldLabel!
    @IBOutlet var percentLabel: BoldLabel!
    @IBOutlet var arrowImageView: UIImageView!

    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Layout

    func layoutForDeck(deck: Deck) {
        nameLabel.text = deck.name
        nameLabel.textColor = deck.color.foregroundColor
        let formattedCumulativePercentCorrect = Double(round(1000 * deck.cumulativePercentCorrect) / 10)
        if formattedCumulativePercentCorrect > 0 {
            percentLabel.text = "\(formattedCumulativePercentCorrect)%"
            percentLabel.textColor = deck.color.foregroundColor
        } else {
            percentLabel.text = nil
        }
        arrowImageView.image = arrowImageView.image?.maskedImageWithColor(deck.color.foregroundColor)

        if deck.color == .white {
            colorView.updateGradientWith(firstColor: UIColor(hex: 0xeeeeee), secondColor: UIColor.white, vertical: false)
        }
        else if deck.color == .gray {
            colorView.updateGradientWith(firstColor: deck.color.backgroundColor, secondColor: UIColor.white, vertical: false)
        }
        else if deck.color == .black {
            colorView.updateGradientWith(firstColor: deck.color.backgroundColor, secondColor: UIColor(hex: 0x333333), vertical: false)
        } else {
            colorView.updateGradientWith(firstColor: deck.color.backgroundColor, secondColor: deck.color.backgroundColor.lighterColor, vertical: false)
        }
    }

}
