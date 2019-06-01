//
//  Concentration.swift
//  ConcentrationGameMVC
//
//  Created by Salma on 5/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation
class Concentration{
    private(set) var cards = [Card]()
    var indexOfOneAndOnlyCardFacedUp : Int?
    init (numberOfPairsOfCards : Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card ()
            cards += [card,card]
        }
        //todo:shuffle the cards
    }
    func chooseCard (at index:Int){
        //the whole logic of the game
        if let matchIndex=indexOfOneAndOnlyCardFacedUp,index != matchIndex{
            //in this case there is a selected card before and i selected another so we check if they are matched
            if cards[matchIndex]==cards[index]{
                //kda m3nah ene e5trt 2 cards shabah b3d
                cards[matchIndex].isMatched=true
                cards[index].isMatched=true
            }
            cards[index].isFaceUp=true
            indexOfOneAndOnlyCardFacedUp=nil
        }
        else
        {
            //either 2 cards or no cards are facedup we el user das 3la card f hyb2a da el one and only facedUP
            for flipDownIndex in cards.indices{
                cards[flipDownIndex].isFaceUp=false //aalb kolo 3la dhro fe 7alt en kan fe 2 selected
            }
            cards[index].isFaceUp=true
            indexOfOneAndOnlyCardFacedUp=index
        }
        }
    }

