//
//  SettingsViewController.swift
//  lab-5-Cmp02-Segue
//
//  Created by Thomas Good on 14/5/20.
//  Copyright © 2020 Thomas Good. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var bubbleSlider: UISlider!
    @IBOutlet var timeSlider: UISlider!
    
    @IBOutlet var bubbleCount: UILabel!
    @IBOutlet var timeCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bubbleCount.text = String(Int(bubbleSlider.value))
        timeCount.text = String(Int(timeSlider.value))

        // Do any additional setup after loading the view.
    }
    @IBAction func bubbleSliderDidChange(_ sender: Any) {
        bubbleCount.text = String(Int(bubbleSlider.value))
    }
    
    @IBAction func timeSliderDidChange(_ sender: Any) {
        timeCount.text = String(Int(timeSlider.value))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(bubbleCount.text, forKey: "bubbleKey")
        UserDefaults.standard.set(timeCount.text, forKey: "timeKey")
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    

}
