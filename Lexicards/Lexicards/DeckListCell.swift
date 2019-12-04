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

    @IBOutlet var colorView: UIView!
    @IBOutlet var nameLabel: BoldLabel!

    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
        colorView.layer.borderColor = UIColor.black.cgColor
        colorView.layer.borderWidth = 2
        colorView.layer.cornerRadius = colorView.frame.size.height / 2
        colorView.clipsToBounds = true
    }

    // MARK: - Layout

    func layoutForDeck(deck: Deck) {
        colorView.backgroundColor = deck.color.backgroundColor
        nameLabel.text = deck.name
    }

}
