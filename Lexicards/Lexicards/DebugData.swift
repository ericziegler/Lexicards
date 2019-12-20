//
//  DebugData.swift
//  Lexicards
//
//  Created by Eric Ziegler on 12/4/19.
//  Copyright © 2019 Zigabytes. All rights reserved.
//

import Foundation

class DebugData {

    // MARK: - Properties

    let deckList = DeckList.shared

    // MARK: - Init

    static let shared = DebugData()

    // MARK: - Populate Data

    func populateData(persist: Bool = false) {
        clearData()

        var deck = Deck(name: "Numbers", color: .gray)
        deck.cards.append(Card(question: "hana", answer: "one"))
        deck.cards.append(Card(question: "dul", answer: "two"))
        deck.cards.append(Card(question: "set", answer: "three"))
        deck.cards.append(Card(question: "net", answer: "four"))
        deck.cards.append(Card(question: "doset", answer: "five"))
        deck.cards.append(Card(question: "yoset", answer: "six"))
        deck.cards.append(Card(question: "ilgob", answer: "seven"))
        deck.cards.append(Card(question: "yodob", answer: "eight"))
        deck.cards.append(Card(question: "ahop", answer: "nine"))
        deck.cards.append(Card(question: "yul", answer: "ten"))
        deckList.decks.append(deck)

        deck = Deck(name: "White Belt", color: .white)
        deck.cards.append(Card(question: "charyut", answer: "attention"))
        deck.cards.append(Card(question: "chunbi", answer: "ready position"))
        deck.cards.append(Card(question: "dobok", answer: "uniform"))
        deck.cards.append(Card(question: "mushim", answer: "empty mind"))
        deck.cards.append(Card(question: "innae", answer: "patience"))
        deck.cards.append(Card(question: "kunyet", answer: "bow"))
        deck.cards.append(Card(question: "kukkiadio", answer: "face the flags"))
        deck.cards.append(Card(question: "sabumnim-kae", answer: "face the teacher"))
        deck.cards.append(Card(question: "sajak", answer: "begin"))
        deck.cards.append(Card(question: "kiyup", answer: "spirited yell"))
        deckList.decks.append(deck)

        deck = Deck(name: "Yellow Belt", color: .yellow)
        deck.cards.append(Card(question: "guekki", answer: "discipline"))
        deck.cards.append(Card(question: "jah jeh", answer: "self-control"))
        deck.cards.append(Card(question: "ap chagi", answer: "front kick"))
        deck.cards.append(Card(question: "yup chagi", answer: "side kick"))
        deck.cards.append(Card(question: "dwi chagi", answer: "back kick"))
        deck.cards.append(Card(question: "dollo chagi", answer: "roundhouse kick"))
        deck.cards.append(Card(question: "ap cha oligi", answer: "front stretching kick"))
        deckList.decks.append(deck)

        deck = Deck(name: "Orange Belt", color: .orange)
        deck.cards.append(Card(question: "moodo", answer: "martial arts"))
        deck.cards.append(Card(question: "taekwondo", answer: "the way of hand & foot fighting"))
        deck.cards.append(Card(question: "poomse", answer: "form"))
        deck.cards.append(Card(question: "gyorugi", answer: "sparring"))
        deck.cards.append(Card(question: "hoshinsul", answer: "self-defense"))
        deckList.decks.append(deck)

        deck = Deck(name: "Blue Belt", color: .blue)
        deck.cards.append(Card(question: "arae mahgi", answer: "low block"))
        deck.cards.append(Card(question: "momtong mahgi", answer: "middle block"))
        deck.cards.append(Card(question: "oogul mahgi", answer: "upper block"))
        deck.cards.append(Card(question: "sohnal mahgi", answer: "knifehand block"))
        deck.cards.append(Card(question: "chirugi", answer: "punching"))
        deckList.decks.append(deck)

        deck = Deck(name: "Green Belt", color: .green)
        deck.cards.append(Card(question: "ap goobi jah she", answer: "front stance"))
        deck.cards.append(Card(question: "dwi goobi jah she", answer: "back stance"))
        deck.cards.append(Card(question: "kima jah she", answer: "horse stance"))
        deck.cards.append(Card(question: "hap-il jah she", answer: "unifying stance"))
        deck.cards.append(Card(question: "goyang-yi jah she", answer: "cat stance"))
        deck.cards.append(Card(question: "bourn jah she", answer: "tiger stance"))
        deckList.decks.append(deck)

        deck = Deck(name: "Purple Belt", color: .purple)
        deck.cards.append(Card(question: "moodoin", answer: "martial artist"))
        deck.cards.append(Card(question: "kahm sa mida", answer: "thank you"))
        deck.cards.append(Card(question: "jah mahn ey yo", answer: "you are welcome"))
        deck.cards.append(Card(question: "bahro", answer: "return to ready position"))
        deck.cards.append(Card(question: "shi-oh", answer: "relax"))
        deck.cards.append(Card(question: "kuman", answer: "end or stop"))
        deckList.decks.append(deck)

        deck = Deck(name: "Brown Belt", color: .brown)
        deck.cards.append(Card(question: "miroe chagi", answer: "push kick"))
        deck.cards.append(Card(question: "naryo chagi", answer: "axe kick"))
        deck.cards.append(Card(question: "nakka chagi", answer: "hook kick"))
        deck.cards.append(Card(question: "bitro chagi", answer: "twist kick"))
        deck.cards.append(Card(question: "goksun chagi", answer: "crescent kick"))
        deckList.decks.append(deck)

        deck = Deck(name: "Red Belt", color: .red)
        deck.cards.append(Card(question: "shi-gong", answer: "beginning of the universe"))
        deck.cards.append(Card(question: "cho-shim", answer: "beginner's mind"))
        deck.cards.append(Card(question: "jo-hwa", answer: "harmony"))
        deck.cards.append(Card(question: "kyum soen", answer: "modesty"))
        deck.cards.append(Card(question: "joen-gyung", answer: "respect"))
        deckList.decks.append(deck)

        deck = Deck(name: "Navy Belt", color: .navy)
        deck.cards.append(Card(question: "shin nyum", answer: "confidence"))
        deck.cards.append(Card(question: "shin eui", answer: "faith"))
        deck.cards.append(Card(question: "jung jick", answer: "honesty"))
        deck.cards.append(Card(question: "hun shin", answer: "dedication"))
        deck.cards.append(Card(question: "soon jong", answer: "obedience"))
        deck.cards.append(Card(question: "ohn jung", answer: "compassion"))
        deck.cards.append(Card(question: "pyun hwa", answer: "peace"))
        deck.cards.append(Card(question: "gyuldan", answer: "determination"))
        deck.cards.append(Card(question: "gyeun gi", answer: "persistance"))
        deckList.decks.append(deck)

        deck = Deck(name: "Skunk Belt", color: .black)
        deck.cards.append(Card(question: "sa rahng", answer: "love"))
        deck.cards.append(Card(question: "yeh eui", answer: "courtesy"))
        deck.cards.append(Card(question: "moog-nyum", answer: "meditation"))
        deck.cards.append(Card(question: "haeng-bok", answer: "happiness"))
        deck.cards.append(Card(question: "choong sung", answer: "loyalty"))
        deck.cards.append(Card(question: "jah-bi", answer: "mercy"))
        deck.cards.append(Card(question: "shim shin soo ryun", answer: "training mind, body, spirit and emotions"))
        deck.cards.append(Card(question: "jung shin tong il", answer: "concentration of mind, body, spirit and emotions"))
        deckList.decks.append(deck)

//        deck = Deck(name: "All", color: .tan)
//        deck.cards.append(Card(question: "charyut", answer: "attention"))
//        deck.cards.append(Card(question: "chunbi", answer: "ready position"))
//        deck.cards.append(Card(question: "dobok", answer: "uniform"))
//        deck.cards.append(Card(question: "mushim", answer: "empty mind"))
//        deck.cards.append(Card(question: "innae", answer: "patience"))
//        deck.cards.append(Card(question: "kunyet", answer: "bow"))
//        deck.cards.append(Card(question: "kukkiadio", answer: "face the flags"))
//        deck.cards.append(Card(question: "sabumnim-kae", answer: "face the teacher"))
//        deck.cards.append(Card(question: "sajak", answer: "begin"))
//        deck.cards.append(Card(question: "kiyup", answer: "spirited yell"))
//        deck.cards.append(Card(question: "guekki", answer: "discipline"))
//        deck.cards.append(Card(question: "jah jeh", answer: "self-control"))
//        deck.cards.append(Card(question: "ap chagi", answer: "front kick"))
//        deck.cards.append(Card(question: "yup chagi", answer: "side kick"))
//        deck.cards.append(Card(question: "dwi chagi", answer: "back kick"))
//        deck.cards.append(Card(question: "dollo chagi", answer: "roundhouse kick"))
//        deck.cards.append(Card(question: "ap cha oligi", answer: "front stretching kick"))
//        deck.cards.append(Card(question: "moodo", answer: "martial arts"))
//        deck.cards.append(Card(question: "taekwondo", answer: "the way of hand & foot fighting"))
//        deck.cards.append(Card(question: "poomse", answer: "form"))
//        deck.cards.append(Card(question: "gyorugi", answer: "sparring"))
//        deck.cards.append(Card(question: "hoshinsul", answer: "self-defense"))
//        deckList.decks.insert(deck, at: 0)

        if persist == true {
            deckList.saveDecks()
        }
    }

    func updateAllDeck() {
        if let deck = deckList.decks.first {
            deck.cards.removeAll()
            deck.cards.append(Card(question: "charyut", answer: "attention"))
            deck.cards.append(Card(question: "chunbi", answer: "ready position"))
            deck.cards.append(Card(question: "dobok", answer: "uniform"))
            deck.cards.append(Card(question: "mushim", answer: "empty mind"))
            deck.cards.append(Card(question: "innae", answer: "patience"))
            deck.cards.append(Card(question: "kunyet", answer: "bow"))
            deck.cards.append(Card(question: "kukkiadio", answer: "face the flags"))
            deck.cards.append(Card(question: "sabumnim-kae", answer: "face the teacher"))
            deck.cards.append(Card(question: "sajak", answer: "begin"))
            deck.cards.append(Card(question: "kiyup", answer: "spirited yell"))
            deck.cards.append(Card(question: "guekki", answer: "discipline"))
            deck.cards.append(Card(question: "jah jeh", answer: "self-control"))
            deck.cards.append(Card(question: "ap chagi", answer: "front kick"))
            deck.cards.append(Card(question: "yup chagi", answer: "side kick"))
            deck.cards.append(Card(question: "dwi chagi", answer: "back kick"))
            deck.cards.append(Card(question: "dollo chagi", answer: "roundhouse kick"))
            deck.cards.append(Card(question: "ap cha oligi", answer: "front stretching kick"))
            deck.cards.append(Card(question: "moodo", answer: "martial arts"))
            deck.cards.append(Card(question: "taekwondo", answer: "the way of hand & foot fighting"))
            deck.cards.append(Card(question: "poomse", answer: "form"))
            deck.cards.append(Card(question: "gyorugi", answer: "sparring"))
            deck.cards.append(Card(question: "hoshinsul", answer: "self-defense"))
            deck.cards.append(Card(question: "arae mahgi", answer: "low block"))
            deck.cards.append(Card(question: "momtong mahgi", answer: "middle block"))
            deck.cards.append(Card(question: "oogul mahgi", answer: "upper block"))
            deck.cards.append(Card(question: "sohnal mahgi", answer: "knifehand block"))
            deck.cards.append(Card(question: "chirugi", answer: "punching"))
            deck.cards.append(Card(question: "ap goobi jah she", answer: "front stance"))
            deck.cards.append(Card(question: "dwi goobi jah she", answer: "back stance"))
            deck.cards.append(Card(question: "kima jah she", answer: "horse stance"))
            deck.cards.append(Card(question: "hap-il jah she", answer: "unifying stance"))
            deck.cards.append(Card(question: "goyang-yi jah she", answer: "cat stance"))
            deck.cards.append(Card(question: "bourn jah she", answer: "tiger stance"))
            deck.cards.append(Card(question: "moodoin", answer: "martial artist"))
            deck.cards.append(Card(question: "kahm sa mida", answer: "thank you"))
            deck.cards.append(Card(question: "jah mahn ey yo", answer: "you are welcome"))
            deck.cards.append(Card(question: "bahro", answer: "return to ready position"))
            deck.cards.append(Card(question: "shi-oh", answer: "relax"))
            deck.cards.append(Card(question: "kuman", answer: "end or stop"))

            deckList.saveDecks()
        }
    }

    // MARK: - Clear Data

    func clearData() {
        deckList.decks.removeAll()
        deckList.saveDecks()
    }

}
