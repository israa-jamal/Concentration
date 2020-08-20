//
//  Concentration.swift
//  Concentration
//
//  Created by Esraa Gamal on 8/19/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import Foundation

class Concentration{
    
    var cards = [Card]()
    init(numOfPairOfCards : Int) {
        for identifer in 0..<numOfPairOfCards{
        let card = Card(identifer: identifer)
        let matchingCard = card
            cards += [card, matchingCard]

        }
    }
    func chooseCard(at index: Int){
        
    }
    // shuffle the cards
}
