//
//  ScoreViewController.swift
//  lab-5-Cmp02-Segue
//
//  Created by Thomas Good on 1/5/20.
//  Copyright © 2020 Thomas Good. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    
    
    @IBOutlet weak var table: UITableView!
    
    var users: [String] = []
    var scores: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        
        
        
//        if let name = userDefaults.string(forKey: "name"){
//            self.nameLabel.text = name
//            let score = userDefaults.integer(forKey: "score")
//            self.scoreLabel.text = String(score)
//        }
        
        
        if userNamesPresentInUserDefaults(key: "userNames") {
            users = userDefaults.stringArray(forKey: "userNames")!
        }
        if scoresPresentInUserDefaults(key: "scores") {
            scores = userDefaults.stringArray(forKey: "scores")!
        }
        
        
        //self.table.register(cell.self, forCellReuseIdentifier: "cell")
        self.table.dataSource = self
        self.table.delegate = self
        
    }
    
    func userNamesPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.stringArray(forKey: key) != nil
    }
    
    func scoresPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.stringArray(forKey: key) != nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let scoreCell = self.table.dequeueReusableCell(withIdentifier: "cell")! as! cell
        print(self.users[indexPath.row])
        print(self.scores[indexPath.row])
        scoreCell.name.text = self.users[indexPath.row]
        scoreCell.score.text = self.scores[indexPath.row]
        //cell.textLabel!.text = self.users[indexPath.row]
        //cell.textLabel!.text! += "\t" + self.scores[indexPath.row]
        return scoreCell
    }
    
    
    
}
