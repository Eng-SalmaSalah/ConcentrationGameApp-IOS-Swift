//
//  Card.swift
//  ConcentrationGameMVC
//
//  Created by Salma on 5/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation
struct Card : Hashable {
    var hashValue: Int {
        return identifier
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier : Int
   
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier () -> Int {
        Card.identifierFactory+=1 //or we can neglect Card. as we access static member from static method
        return Card.identifierFactory
    }
    
    init (){
        self.identifier=Card.getUniqueIdentifier()
    }
}
