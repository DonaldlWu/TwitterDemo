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
            
            // Shortcuts
            let username = usernameText.text!.lowercased()
            let password = passwordText.text!
            
            // Send request to mysql db
            // Url to accesss out php file
            let url = URL(string: "http://localhost/Twitter/login.php")!
            
            // Request url
            var request = URLRequest(url: url)
            
            // Method to ppass data POST - cause it is secured
            request.httpMethod = "POST"
            
            // Body gonna be appended to url
            let body = "username=\(username)&password=\(password)"
            request.httpBody = body.data(using: String.Encoding.utf8)
            
            // Launch session
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                
                if error == nil {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                        guard let parseJSON = json else {
                            print("Error")
                            return
                        }

                        print(parseJSON)
                        
                        let id = parseJSON["id"] as? String
                        
                        if id != nil {
                            
                            // Successfully logged in
                            // Move to next page
                            
                        }
                        
                    } catch {
                        print("Caught an error: \(error)")
                    }
                    
                } else {
                    print("Error: \(String(describing: error))")
                }
                
                
            }).resume()
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
