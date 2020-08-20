//
//  ViewController.swift
//  Concentration
//
//  Created by Esraa Gamal on 5/25/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numOfPairOfCards: (cardButtons.count + 1) / 2)
    
//    outlets
    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    //array of emojis
    var count = 0
    {
        didSet{
            flipLabel.text = "Flips: \(count)"

        }
    }
    let emojis = ["😡","😥","😍","😡","😍","😥"]
    
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
//    what happens when you flip a card
    func flipCard(with emoji : String, on button : UIButton){
        if button.currentTitle != emoji
        {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.4142037239, green: 0.232510499, blue: 0.6825031726, alpha: 1)
        }else{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)  }
    }
    func updateView(){
        for index in cardButtons.indices{
            
        }
    }
    
}

