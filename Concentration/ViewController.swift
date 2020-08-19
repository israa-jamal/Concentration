//
//  ViewController.swift
//  Concentration
//
//  Created by Esraa Gamal on 5/25/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    outlets
    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    //array of emojis
    var count = 0
//    {
//        didSet{
//            flipLabel.text = "Flips: \(count)"
//
//        }
//    }
    let emojis = ["😡","😥","😍","😡","😍","😥"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

// what happens when you press on a card
    @IBAction func cardClicked(_ sender: UIButton) {
        count += 1
        flipLabel.text = "Flips: \(count)"
        if let card = cardButtons.firstIndex(of: sender){
        flipCard(with: emojis[card], on: sender)
        }
       
    }
//    what happens when you flip a card
    func flipCard(with emoji : String, on button : UIButton){
        if button.currentTitle != ""
        {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9862303138, green: 0.6227525473, blue: 0.04674138874, alpha: 1)
        }else{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)  }
    }
    
}

