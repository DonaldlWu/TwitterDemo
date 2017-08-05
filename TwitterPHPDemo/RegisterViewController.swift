//RegisterViewController
//  ViewController.swift
//  TwitterPHPDemo
//
//  Created by 吳得人 on 2017/8/3.
//  Copyright © 2017年 吳得人. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    
    @IBAction func registerClicked(_ sender: Any) {
        
        // If no text
        if (userNameText.text?.isEmpty)! || (passwordText.text?.isEmpty)! || (emailText.text?.isEmpty)! || (firstNameText.text?.isEmpty)! || (lastNameText.text?.isEmpty)! {
            
            // red placeholder
            userNameText.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor: UIColor.red])
            passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.red])
            emailText.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: UIColor.red])
            firstNameText.attributedPlaceholder = NSAttributedString(string: "first name", attributes: [NSAttributedStringKey.foregroundColor: UIColor.red])
            lastNameText.attributedPlaceholder = NSAttributedString(string: "last name", attributes: [NSAttributedStringKey.foregroundColor: UIColor.red])
            
        // If text is entered
        } else {
            
            // Create new user in MySQL
            
            // Url to php file
            let url = URL(string: "http://localhost/Twitter/register.php")!
            
            // Request to this file
            var request = URLRequest(url: url)
            
            // Method to pass data to this file
            request.httpMethod = "POST"
            
            // Body to be appendded to url
            let body = "username=\(userNameText.text!.lowercased())&password=\(passwordText.text!)&email=\(emailText.text!)&fullname=\(firstNameText.text!)%20\(lastNameText.text!)"

            request.httpBody = body.data(using: String.Encoding.utf8)
            // Proceed request
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                
                if error == nil {
                    
                    // Get main quene in code process to communicate back to UI
                    DispatchQueue.main.async {
                        do {
                            
                            // Get json result
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                            
                            // Assign json to new var parseJSON in secured way
                            guard let parseJSON = json else {
                                print("error while parsing")
                                return
                            }
                            
                            // Get id from parseJSON dictionary
                            let id = parseJSON["id"]
                            
                            // If there is some id value
                            if id != nil {
                                print(parseJSON)
                            }
                            
                        } catch {
                            print("Caught an error: \(error)")
                        }
                    }
                    
                // If unable to proceed request
                } else {
                    print("error \(error!)")
                }
            
            // Launch prepared session
            }).resume()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

