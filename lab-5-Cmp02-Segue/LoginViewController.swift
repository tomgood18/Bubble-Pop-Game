//
//  LoginViewController.swift
//  lab-5-Cmp02-Segue
//
//  Created by Thomas Good on 1/5/20.
//  Copyright © 2020 Thomas Good. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (nameField.text == ""){
            segue.destination.navigationItem.title = "Guest"
        }
        else {
            segue.destination.navigationItem.title = nameField.text!
            
        }
        
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
