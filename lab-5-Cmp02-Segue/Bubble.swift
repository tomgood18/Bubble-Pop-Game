//
//  File.swift
//  lab-5-Cmp02-Segue
//
//  Created by Thomas Good on 14/5/20.
//  Copyright © 2020 Thomas Good. All rights reserved.
//

import UIKit

class Bubble: UIButton {
    var bubbleScore: Int = 1
    var bubbleId: Int = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        let colour: String = randomBubble()
        switch colour {
        case "Red": self.bubbleScore = 1; self.backgroundColor = UIColor.red
        case "Pink": self.bubbleScore = 2; self.backgroundColor = UIColor.systemPink
        case "Green": self.bubbleScore = 5; self.backgroundColor = UIColor.green
        case "Blue": self.bubbleScore = 8; self.backgroundColor = UIColor.blue
        case "Black": self.bubbleScore = 10; self.backgroundColor = UIColor.black
        default: fatalError("Error")
        }
        //self.bubbleScore = 5
        //self.backgroundColor = UIColor.blue
        self.layer.cornerRadius = 0.5 * frame.width
    }
    
    required init?(coder:NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.blue
        self.layer.cornerRadius = 0.5 * self.bounds.width
    }
    
    // Probabilities of colour selection in bubble creation
    func randomBubble() -> String {
        let random = Int(arc4random_uniform(100))
        var colour: String
        switch random {
            case 1...40: colour = "Red"
            case 41...70: colour = "Pink"
            case 71...85: colour = "Green"
            case 86...95: colour = "Blue"
            case 96...100: colour = "Black"
            default: colour = "Red"
        }
        
        return colour
    }
    
}
