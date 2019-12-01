//
//  DeckList.swift
//  Lexicards
//
//  Created by Eric Ziegler on 12/1/19.
//  Copyright © 2019 Zigabytes. All rights reserved.
//

import Foundation

// MARK: - Constants

let DeckListCacheKey = "DeckListCacheKey"

class DeckList {

    // MARK: - Properties

    var decks = [Deck]()

    // MARK: - Init

    init() {
        loadDecks()
    }

    // MARK: - Loading / Saving

    func loadDecks() {
        if let deckListData = UserDefaults.standard.data(forKey: DeckListCacheKey) {
            if let deckList = NSKeyedUnarchiver.unarchiveObject(with: deckListData) as? [Deck] {
                decks = deckList
            }
        }
    }

    func saveDecks() {
        let deckListData = NSKeyedArchiver.archivedData(withRootObject: decks)
        UserDefaults.standard.set(deckListData, forKey: DeckListCacheKey)
        UserDefaults.standard.synchronize()

    }

}
