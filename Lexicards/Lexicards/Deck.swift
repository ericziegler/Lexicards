//
//  Deck.swift
//  Lexicards
//
//  Created by Eric Ziegler on 12/1/19.
//  Copyright © 2019 Zigabytes. All rights reserved.
//

import UIKit

// MARK: - Constants

let DeckIdCacheKey = "DeckIdCacheKey"
let DeckNameCacheKey = "DeckNameCacheKey"
let DeckColorHexCacheKey = "DeckColorHexCacheKey"
let DeckCardsCacheKey = "DeckCardsCacheKey"

// MARK: - Enums

enum DeckColor: Int {
    case white = 0xffffff
    case yellow = 0xffcc00
    case orange = 0xff6600
    case blue = 0x2a7fff
    case green = 0x00aa44
    case purple = 0x7f2aff
    case brown = 0xa05a2c
    case red = 0xff0000
    case navy = 0x003380
    case black = 0x000000

    var backgroundColor: UIColor {
        return UIColor(hex: self.rawValue)
    }

    var foregroundColor: UIColor {
        switch self {
        case .white, .yellow:
            return UIColor.white
        default:
            return UIColor.black
        }
    }
}

class Deck: NSObject, NSCoding {

    // MARK: - Properties

    var identifier = ""
    var name = ""
    var color = DeckColor.black
    var cards = [Card]()
    var percentCorrect: Double {
        if cards.count == 0 {
            return 0
        }

        var correctCount = 0
        for curCard in cards {
            if curCard.status == .correct {
                correctCount += 1
            }
        }
        return Double(correctCount) / Double(cards.count)
    }

    // MARK: - Init

    override init() {
        super.init()
        identifier = UUID().uuidString
    }

    // MARK: - NSCoding

    required init?(coder decoder: NSCoder) {
        if let deckIdentifier = decoder.decodeObject(forKey: DeckIdCacheKey) as? String {
            identifier = deckIdentifier
        }
        if let deckName = decoder.decodeObject(forKey: DeckNameCacheKey) as? String {
            name = deckName
        }
        let colorHex = decoder.decodeInteger(forKey: DeckColorHexCacheKey)
        color = DeckColor(rawValue: colorHex)!
        if let cardsData = decoder.decodeObject(forKey: DeckCardsCacheKey) as? Data, let deckCards = NSKeyedUnarchiver.unarchiveObject(with: cardsData) as? [Card] {
            cards = deckCards
        }
    }

    public func encode(with coder: NSCoder) {
        coder.encode(identifier, forKey: DeckIdCacheKey)
        coder.encode(name, forKey: DeckNameCacheKey)
        coder.encode(color.rawValue, forKey: DeckColorHexCacheKey)
        let cardsData = NSKeyedArchiver.archivedData(withRootObject: cards)
        coder.encode(cardsData, forKey: DeckCardsCacheKey)
    }

}
