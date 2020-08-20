//
//  Card.swift
//  Concentration
//
//  Created by Esraa Gamal on 8/19/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import Foundation
struct Card {
    var isDisplayed = false
    var isMatched = false
    var ident : Int
    init(identifer : Int) {
        self.ident = identifer
    }
}
