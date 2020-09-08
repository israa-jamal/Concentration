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
    lazy var game = Concentration(numOfPairOfCards: (cardButtons.count + 1) / 2)
    
    //    outlets
    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    //array of emojis
    let emojis = ["👾" ,"🧚🏻‍♂️" ,"🧞‍♂️" ,"🏎️" ,"👽" ,"🐲" ,"🤖" ,"🤺" ,"👻"]
    func emoji (for card: Card) -> String{
        return "?"
    }
    var count = 0
    {
        //whenever the count change the flipLabel change
        didSet{
            flipLabel.text = "Flips: \(count)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // what happens when you press on a card
    @IBAction func cardClicked(_ sender: UIButton) {
        count += 1
        if let card = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: card)
            updateView()
        }
    }
    
    //update view when something changes
    func updateView(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            // if the card is not visable flip it up
            
            if card.isDisplayed{
                button.setTitle("", for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                //when the card is visable flip it down
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.4142037239, green: 0.232510499, blue: 0.6825031726, alpha: 0) : #colorLiteral(red: 0.4142037239, green: 0.232510499, blue: 0.6825031726, alpha: 1)
            }
        }
    }
    
    
    
}

