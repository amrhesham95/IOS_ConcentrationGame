//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Esraa Hassan on 5/10/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var emojiesArray=["👻","🎃","👻","🎃"]
    @IBOutlet var cardButtons: [UIButton]!
    lazy var game = Concentration(numberOfCardPairs: cardButtons!.count/2)
    var flipCount=0{
        didSet{
            flipLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber=cardButtons!.index(of: sender){
            flipCount += 1
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("optional not set!")
        }
        //flipCard(withEmoji: "👻", on: sender)
        
        
    }
   
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if(card.isFacedUp){
                button.setTitle(emoji(for :card), for: UIControlState.normal)
                button.backgroundColor=#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor=card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    let emojiChoice=["🎃","👻","🦇","💩","👅","🤪","😱","🐥","⭐️"]
    var emoji=[Int:String]()
    @IBOutlet weak var flipLabel: UILabel!
    func emoji(for card:Card)->String{
        if emoji[card.identifier]==nil,emojiChoice.count>0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
            emoji[card.identifier] = emojiChoice[randomIndex]
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

