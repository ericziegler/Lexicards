//
//  Card.swift
//  Lexicards
//
//  Created by Eric Ziegler on 12/1/19.
//  Copyright © 2019 Zigabytes. All rights reserved.
//

import Foundation

// MARK: - Constants

let CardQuestionCacheKey = "CardQuestionCacheKey"
let CardAnswerCacheKey = "CardAnswerCacheKey"
let CardStatusCacheKey = "CardStatusCacheKey"

// MARK: - Enums

enum CardStatus: Int {
    case none
    case correct
    case incorrect
}

class Card: NSObject, NSCoding {

    // MARK: - Properties

    var question = ""
    var answer = ""
    var status = CardStatus.none
    var isNewQuestion: Bool {
        return question.count == 0
    }

    // MARK: - Init

    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }

    override init() {
        super.init()
    }

    // MARK: - NSCoding

    required init?(coder decoder: NSCoder) {
        if let cardQuestion = decoder.decodeObject(forKey: CardQuestionCacheKey) as? String {
            question = cardQuestion
        }
        if let cardAnswer = decoder.decodeObject(forKey: CardAnswerCacheKey) as? String {
            answer = cardAnswer
        }
        if let cardStatus = CardStatus(rawValue: decoder.decodeInteger(forKey: CardStatusCacheKey)) {
            status = cardStatus
        }
    }

    public func encode(with coder: NSCoder) {
        coder.encode(question, forKey: CardQuestionCacheKey)
        coder.encode(answer, forKey: CardAnswerCacheKey)
        coder.encode(status.rawValue, forKey: CardStatusCacheKey)
    }

}
