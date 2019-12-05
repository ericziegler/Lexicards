//
//  CardListCell.swift
//  Lexicards
//
//  Created by Eric Ziegler on 12/5/19.
//  Copyright © 2019 Zigabytes. All rights reserved.
//

import UIKit

// MARK: - Constants

let CardListCellId = "CardListCellId"
let CardListCellHeight: CGFloat = 55

class CardListCell: UITableViewCell {

    // MARK: - Properties

    @IBOutlet var nameLabel: RegularLabel!

    // MARK: - Init

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Layout

    func layoutFor(card: Card) {
        nameLabel.text = card.question
    }

}
