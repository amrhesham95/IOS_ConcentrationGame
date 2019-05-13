//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Esraa Hassan on 5/11/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyOneFacedUpCard:Int?
    func chooseCard(at index:Int){
        if !cards[index].isMatched{
            if let matchedIndex=indexOfOneAndOnlyOneFacedUpCard,matchedIndex != index{
                //check if matched
                if(cards[matchedIndex].identifier == cards[index].identifier){
                    cards[matchedIndex].isMatched=true;
                    cards[index].isMatched=true;
                }
                cards[index].isFacedUp=true;
                indexOfOneAndOnlyOneFacedUpCard=nil;
            }else{
                for flipDown in cards.indices{
                    cards[flipDown].isFacedUp=false;
                }
                cards[index].isFacedUp=true;
                indexOfOneAndOnlyOneFacedUpCard=index;	
            }
        }
    }
    
    init(numberOfCardPairs:Int){
        for identifier in 1 ... numberOfCardPairs{
            let card=Card()
            cards += [card,card]
            
        }
        
    }
}
