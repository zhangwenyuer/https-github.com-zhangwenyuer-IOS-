//
//  ViewController.swift
//  Concentration
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 zwy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1) / 2)
    var filpCount = 0{
        didSet {
            flipCountLable.text = "Flips: \(filpCount)"
        }
    }
    
    @IBOutlet weak var flipCountLable: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["🍎","🍉","🍓","🍊","🥝","🍇","🍍","🍌","🍑","🥥","🍋","🍐"]
    var emoji = [Int: String]()
    
    @IBAction func touchCard(_ sender: UIButton) {
        filpCount += 1
        if let cardNmber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNmber)
            updateViewFromModel()
        }else{
            print("chosen card was not in Carbuttons")
        }
    }
    func flipCard(withEmoji emoji: String ,on button:UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.6589577198, blue: 0.07955218107, alpha: 1)
            
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.2274509804, green: 0.4784313725, blue: 0.968627451, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

