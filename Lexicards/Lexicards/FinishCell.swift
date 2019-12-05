//
//  FinishCell.swift
//  Lexicards
//
//  Created by Eric Ziegler on 12/5/19.
//  Copyright © 2019 Zigabytes. All rights reserved.
//

import UIKit

// MARK: - Constants

let FinishCellId = "FinishCellId"
let FinishCellHeight: CGFloat = 80

// MARK: - Protocols

protocol FinishCellDelegate {
    func finishCellCompleteTapped(finishCell: FinishCell)
}

class FinishCell: UITableViewCell {

    // MARK: - Properties

    @IBOutlet var completeButton: BoldButton!

    var delegate: FinishCellDelegate?

    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
        completeButton.layer.cornerRadius = 12
    }

    // MARK: - Actions

    @IBAction func completeTapped(_ sender: AnyObject) {
        delegate?.finishCellCompleteTapped(finishCell: self)
    }

}
