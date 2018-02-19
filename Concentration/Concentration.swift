//
//  Concentration.swift
//  Concentration
//
//  Created by Dustin D'Avignon on 2/16/18.
//  Copyright © 2018 Dustin D'Avignon. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    private(set) var score = 0
    
    private(set) var flipCount = 0
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
//            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp }
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func setScorePoint(card1: Card, card2: Card) {
        score += 2
    }
    
    mutating func setScoreMismatch(card1: Card, card2: Card) {
        score += 0 - (card1.isSeen ? 1 : 0) - (card2.isSeen ? 1 : 0)
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards.")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    setScorePoint(card1: cards[index], card2: cards[matchIndex])
                } else {
                    setScoreMismatch(card1: cards[index], card2: cards[matchIndex])
                }
                cards[index].isFaceUp = true
                cards[index].isSeen = true
                cards[matchIndex].isSeen = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        flipCount += 1
    }
    
    mutating func shuffleCards() {
        for index in 0..<cards.count {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            cards.swapAt(index, randomIndex)
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards.")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        shuffleCards()
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
