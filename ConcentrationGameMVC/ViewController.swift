//
//  ViewController.swift
//  ConcentrationGameMVC
//
//  Created by Salma on 5/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipCount = 0{
        didSet {
            flipsNumOutlet.text="flips: \(flipCount)"
        }
    }
    lazy var game = Concentration (numberOfPairsOfCards: (cardButtons.count+1)/2) //3lshan l game my7slhash initialize abl ma l UI y7slo loading we used lazy
    
    
    
    @IBOutlet weak var flipsNumOutlet: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func flipCard(_ sender: UIButton) {
        
        flipCount+=1
        if let selectedCard = cardButtons.index(of: sender){
            game.chooseCard(at: selectedCard)
            updateUIFromModel()
        }
        else{
            print("card not found in card Buttons")
        }
    }
    
    func updateUIFromModel() {
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
    
    var emojisList = ["👻","🎃","😁","🐶","🎄","😇","😎","🚗","🍄"]
    
    var emojiDict = Dictionary<Int,String>()//empty dictionary
    
    func emoji(for card : Card)->String {
        //assign emojis to each card in dict
        //kol 2 cards lehom nfs l id (check class concentration)
        //so kol 2 card hya5do nfs l emoji
        if emojiDict[card.identifier]==nil,emojisList.count>0{//instead of neasted ifs we use ,
            let randomEmojiIndex = Int(arc4random_uniform(UInt32(emojisList.count)))
            
            //tms7 l emoji 3lshan admn eno mytkrrsh w btrg3 ele btms7o
            emojiDict[card.identifier]=emojisList.remove(at : randomEmojiIndex)
        }
        
        /*if emojiDict[card.identifier] != nil{
            return emojiDict[card.identifier]! //it is optional because dict may don't have value for this index
        }else{
            return"?"
        }*/
        
        //this is more simplified
        return emojiDict[card.identifier] ?? "?" //if nil,returns ele b3d el ?? if not nil returns l abl el ??

    }
    
}

