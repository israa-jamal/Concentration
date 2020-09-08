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
    var cards = [Card]()
    
    //when you use concentration you have to init the number of pairs
    init(numOfPairOfCards : Int) {
        //give every card a unique identifer
        for i in 0..<numOfPairOfCards{
            let card = Card(identifer: i)
            //and copy this card
            let matchingCard = card
            //and add both matching cards to the array
            cards += [card, matchingCard]
            
        }
    }
    
    func chooseCard(at index: Int){
        
    }
    // shuffle the cards
}
