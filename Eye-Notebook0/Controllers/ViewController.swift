//
//  ViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 15/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//

import UIKit
//import CLTypingLabel
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    var ref: DatabaseReference!
            
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    var charIndex = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

//        titleLabel.text="Eye-notebook"
                titleLabel.text = ""
                let text = "Eye-notebook"
        
                for i in text{
                    Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charIndex), repeats: false) { (timer) in
                        self.titleLabel.text?.append(i)
                    }
                    charIndex += 1
                }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func registerKeyPress(_ sender: UIButton) {
//        performSegue(withIdentifier: "goToRegister", sender: self)
    }
    
    
    @IBAction func loginKeyPress(_ sender: UIButton) {
        
        if let email = userNameTextField.text, let password = passwordTextField.text
        {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e)
                }else{
                    self.performSegue(withIdentifier: "goToHome", sender:self)
                }
             
            }
        }
        
    }
    
    
    
}

