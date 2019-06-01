//
//  ViewController.swift
//  ConcentrationGameMVC
//
//  Created by Salma on 5/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private(set) var flipCount = 0{
        didSet {
            flipsNumOutlet.text="flips: \(flipCount)"
        }
    }
    private lazy var game = Concentration (numberOfPairsOfCards: numberOfPairsOfCards) //3lshan l game my7slhash initialize abl ma l UI y7slo loading we used lazy
    
    
    var numberOfPairsOfCards : Int{
        return (cardButtons.count+1)/2
    }
    
    
    @IBOutlet private weak var flipsNumOutlet: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    @IBAction private func flipCard(_ sender: UIButton) {
        
        flipCount+=1
        if let selectedCard = cardButtons.index(of: sender){
            game.chooseCard(at: selectedCard)
            updateUIFromModel()
        }
        else{
            print("card not found in card Buttons")
        }
    }
    
    private func updateUIFromModel() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for : card), for: UIControlState.normal )
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
            }
        }
        
    }
    
    private var emojisList = ["👻","🎃","😁","🐶","🎄","😇","😎","🚗","🍄"]
    
    private var emojiDict = Dictionary<Card,String>()//empty dictionary
    
    private func emoji(for card : Card)->String {
        //assign emojis to each card in dict
        //kol 2 cards lehom nfs l id (check class concentration)
        //so kol 2 card hya5do nfs l emoji
        if emojiDict[card]==nil,emojisList.count>0{//instead of neasted ifs we use ,
            
            emojiDict[card]=emojisList.remove(at : emojisList.count.arc4random)
        }
        
        /*if emojiDict[card.identifier] != nil{
         return emojiDict[card.identifier]! //it is optional because dict may don't have value for this index
         }else{
         return"?"
         }*/
        
        //this is more simplified
        return emojiDict[card] ?? "?" //if nil,returns ele b3d el ?? if not nil returns l abl el ??
        
    }
    
}
extension Int {
    
    var arc4random : Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0{
            return -Int(arc4random_uniform(UInt32(self)))
        }else {
            return 0
        }

    }
}



