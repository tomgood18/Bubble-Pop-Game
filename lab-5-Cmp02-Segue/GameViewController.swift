//
//  GameViewController.swift
//  lab-5-Cmp02-Segue
//
//  Created by Thomas Good on 1/5/20.
//  Copyright © 2020 Thomas Good. All rights reserved.
//

import UIKit
import Foundation

class GameViewController: UIViewController {

    
    @IBOutlet var hScoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var endGameLabel: UILabel!
    @IBOutlet weak var hScoreButton: UIButton!
    
    var time: Int = 60
    var bubbleCount: Int = 15
    var bubbles = [UIButton]()
    var i: Int = 0
    var bColour: UIColor!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if timePresentInUserDefaults(key: "timeKey") {
            time = Int(UserDefaults.standard.string(forKey: "timeKey")!)!
        }
        if bubblesPresentInUserDefaults(key: "bubbleKey") {
            bubbleCount = Int(UserDefaults.standard.string(forKey: "bubbleKey")!)!
        }
        
        
        let userDefaults = UserDefaults.standard
        let score = userDefaults.integer(forKey: "score")
        self.hScoreLabel.text = String(score)
        
        self.timeLabel.text = String(time)
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            
            
            // - After 1 iteration, clear all bubbles from view
            if self.i > 0{
                for n in 1...self.bubbleCount {
                    self.bubbles[n-1].removeFromSuperview()
                }
                // - Clear bubbles array for next iteration
                
            }
            
            
            // 1. Counting down time
            self.time -= 1
            // 2. Update timeLabel
            self.timeLabel.text = String(self.time)
            // 3. Check if 0 or below, then invalidate
            if self.time <= 0 {
                timer.invalidate()
                print("Game Over")
                self.endGameLabel.isHidden = false
                for n in 1 ... self.bubbleCount {
                    self.bubbles[n-1].removeFromSuperview()
                }
                self.hScoreButton.isHidden = false;
                self.saveScore();
            }
            else {
                // - Creates amount of bubbles per second specified in settings
                self.bubbles.removeAll()
                var yValue: Int = 180
                for _ in 1 ... self.bubbleCount {
                    var size: Int = 45
                    
                    switch self.bubbleCount {
                    case 15: size = 45
                    case 14: size = 48
                    case 13: size = 51
                    case 12: size = 54
                    case 11: size = 57
                    case 10: size = 60
                    case 9: size = 63
                    case 8: size = 66
                    case 7: size = 69
                    case 6: size = 72
                    case 5: size = 75
                    default: fatalError("Error")
                    }
                    let randomX = Int.random(in: 20...352)
                    
                    let frame = CGRect(x: randomX, y: yValue, width: size, height: size)
                    let bubble = Bubble(frame: frame)
                    self.bubbles.append(bubble)
                    
                    bubble.addTarget(self, action: #selector(self.addScoreButton), for: UIControl.Event.touchUpInside)
                    self.view.addSubview(bubble)
                    yValue += size
                }
                self.i += 1
            }
        }
    }
    
    func timePresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    func bubblesPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    func userNamesPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.stringArray(forKey: key) != nil
    }
    
    func scoresPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.stringArray(forKey: key) != nil
    }
  
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)        
    }
    
    func saveScore() {
        let userName = self.navigationItem.title
          let score = scoreLabel.text!
          var userNames = [userName]
          var scores = [score]
          
          
          if userNamesPresentInUserDefaults(key: "userNames") {
              let tempUserNames = UserDefaults.standard.stringArray(forKey: "userNames")
              
              
              for n in tempUserNames! {
                  userNames.append(n)
              }
              
          }
          if scoresPresentInUserDefaults(key: "scores") {
              let tempScores = UserDefaults.standard.stringArray(forKey: "scores")
              
              for n in tempScores! {
                  scores.append(n)
              }
          }
          
          
          let userDefaults = UserDefaults.standard
          
        
          userDefaults.set(userNames, forKey: "userNames")
          userDefaults.set(scores, forKey: "scores")
          
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//
//        // get score & username
//        let userName = self.navigationItem.title
//        let score = scoreLabel.text!
//        var userNames = [userName]
//        var scores = [score]
//
//
//        if userNamesPresentInUserDefaults(key: "userNames") {
//            let tempUserNames = UserDefaults.standard.stringArray(forKey: "userNames")
//
//
//            for n in tempUserNames! {
//                userNames.append(n)
//            }
//
//        }
//        if scoresPresentInUserDefaults(key: "scores") {
//            let tempScores = UserDefaults.standard.stringArray(forKey: "scores")
//
//            for n in tempScores! {
//                scores.append(n)
//            }
//        }
//
//
//        let userDefaults = UserDefaults.standard
//
//
//        userDefaults.set(userNames, forKey: "userNames")
//        userDefaults.set(scores, forKey: "scores")
//
//        //userDefaults.set(score, forKey: "score")
//        //userDefaults.set(userName, forKey: "name")
//
//    }
    
   
    
    @IBAction func addScoreButton(_ sender: Bubble) {
        if let score = self.scoreLabel.text {
            if var scoreNum = Int(score) {
                if bColour == sender.backgroundColor {
                    scoreNum += Int(round(Double(sender.bubbleScore) * 1.5))
                }
                else {
                    scoreNum += sender.bubbleScore
                }
                
                self.scoreLabel.text = String(scoreNum)
            }
            let hScore: Int = Int(hScoreLabel.text!)!
            let score: Int = Int(scoreLabel.text!)!
            if hScore < score {
                hScoreLabel.text! = scoreLabel.text!
            }
        }
        bColour = sender.backgroundColor!
        sender.removeFromSuperview()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
