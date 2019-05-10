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
    var flipCount=0{
        didSet{
            flipLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber=cardButtons!.index(of: sender){
            flipCard(withEmoji: emojiesArray[cardNumber], on: sender)
        }else{
            print("optional not set!")
        }
        //flipCard(withEmoji: "👻", on: sender)
        
        
    }
   
   
    
    @IBOutlet weak var flipLabel: UILabel!
    func flipCard(withEmoji emoji:String,on button:UIButton){
        flipCount += 1
        if(button.currentTitle == emoji){
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor=#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor=#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
}

