//
//  Card.swift
//  Concentration
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 zwy. All rights reserved.
//

import Foundation
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier:Int
    
    static var identifFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifFactory += 1
        return identifFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
