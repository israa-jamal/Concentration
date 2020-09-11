//
//  Concentration.swift
//  Concentration
//
//  Created by Esraa Gamal on 8/19/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import Foundation

class Concentration{
    
    //array of struct card
    private(set) var cards = [Card]()
    private var indexOfOnlyOneCardFacedUp: Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isDisplayed{
                    if foundIndex == nil{
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices {
                cards[index].isDisplayed = (index == newValue)
            }
        }
    }
    //when you use concentration you have to init the number of pairs
    init(numOfPairOfCards : Int) {
        assert(numOfPairOfCards > 0, "Concentration.init(\(numOfPairOfCards)): you must at least have one pair of cards")
        //give every card a unique identifer
        for _ in 0..<numOfPairOfCards{
            let card = Card()
            //and copy this card
            //and add both matching cards to the array
            cards += [card, card]
            
        }
    }
    
    //the main game
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index is not in the cards")
        //if there are no matching cards
        if !cards[index].isMatched{

            if let matchIndex = indexOfOnlyOneCardFacedUp, matchIndex != index{
                if cards[matchIndex].ident == cards[index].ident{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isDisplayed = true
            }else{
                indexOfOnlyOneCardFacedUp = index
            }
        }
    }
    // shuffle the cards
}
