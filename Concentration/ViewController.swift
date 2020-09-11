//
//  ViewController.swift
//  Concentration
//
//  Created by Esraa Gamal on 5/25/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //create game
    private lazy var game = Concentration(numOfPairOfCards: (cardButtons.count + 1) / 2)
    
    //    outlets
    @IBOutlet private weak var flipLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    private(set) var count = 0
    {
        //whenever the count change the flipLabel change
        didSet{
            flipLabel.text = "Flips: \(count)"
        }
    }
    
    // what happens when you press on a card
    @IBAction private func cardClicked(_ sender: UIButton) {
        count += 1
        if let card = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: card)
            updateView()
        }
    }
    
    //update view when something changes
    private func updateView(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            // if the card is not visable flip it up
            
            if card.isDisplayed{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                //when the card is visable flip it down
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.4142037239, green: 0.232510499, blue: 0.6825031726, alpha: 0) : #colorLiteral(red: 0.4142037239, green: 0.232510499, blue: 0.6825031726, alpha: 1)
            }
        }
    }
//    private var emojisArray = ["👾" ,"🧚🏻‍♂️" ,"🧞‍♂️" ,"🏎️" ,"👽" ,"🐲" ,"🤖" ,"🤺" ,"👻", "🦄"]
    private var emojisArray = ["A" , "B", "C" , "A" , "B", "C" , "A" , "B", "C" , "D"]

    private var emojis = [Int: String]()
    
    //setting an emoji for a card
    private func emoji (for card: Card) -> String{
        //if the card is not already in the dic and there are still avaiable emojis:
        if emojis[card.ident] == nil, emojisArray.count > 0{
            //get a random index and put its emoji in the dic
            let randomIndex = Int(arc4random_uniform(UInt32(emojisArray.count)))
            emojis[card.ident] = emojisArray.remove(at: randomIndex)
        }
        return emojis[card.ident] ?? "?"
    }
    
    
    
}

