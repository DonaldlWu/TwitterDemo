//
//  LoginViewController.swift
//  TwitterPHPDemo
//
//  Created by 吳得人 on 2017/8/7.
//  Copyright © 2017年 吳得人. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // UserInterface object
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    // Clicked login button
    @IBAction func loginClick(_ sender: Any) {
        
        // If no text entered
        if (usernameText.text?.isEmpty)! || (passwordText.text?.isEmpty)! {
            
            // Red placeholders
            usernameText.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor: UIColor.red])
            passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.red])
        } else {
            
            // Send request to mysql db
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
