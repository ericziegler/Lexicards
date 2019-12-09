//
//  MainController.swift
//  Lexicards
//
//  Created by Eric Ziegler on 11/30/19.
//  Copyright © 2019 Zigabytes. All rights reserved.
//

import UIKit

class MainController: BaseViewController {

    // MARK: - Properties

    @IBOutlet var headerView: UIView!
    @IBOutlet var bodyView: UIView!
    @IBOutlet var headerLabel: BoldLabel!
    @IBOutlet var deckTable: UITableView!

    let deckList = DeckList.shared

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        deckTable.reloadData()
    }

    // MARK: - Actions

    @IBAction func addTapped(_ sender: AnyObject) {
        print("ADD TAPPED")
    }

}

extension MainController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deckList.decks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let deck = deckList.decks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: DeckListCellId, for: indexPath) as! DeckListCell
        cell.layoutForDeck(deck: deck)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DeckListCellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let deck = deckList.decks[indexPath.row]
        let controller = DeckController.createControllerFor(deck: deck)
        navigationController?.pushViewController(controller, animated: true)
    }

}

