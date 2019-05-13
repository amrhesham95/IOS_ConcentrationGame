//
//  Card.swift
//  ConcentrationGame
//
//  Created by Esraa Hassan on 5/11/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
struct Card
{
    var isFacedUp=false
    var isMatched=false
    var identifier:Int
    static var identifierFactory=0
    static func getUniqueID()->Int{
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    init(){
        identifier = Card.getUniqueID()
    }
}
