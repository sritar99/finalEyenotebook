//
//  RegisterViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 15/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class RegisterViewController: UIViewController {
//    let defaults = UserDefaults.standard
    var ref: DatabaseReference! 
    @IBOutlet weak var firstnameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var medicalTextField: UITextField!
    
    @IBOutlet weak var instNameTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Eye-notebook"
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func signUpKeyPress(_ sender: UIButton) {

        
        if let firstname = firstnameTextField.text, let lastname = lastNameTextField.text,let email = emailTextField.text, let password = passwordTextField.text,let speciality = medicalTextField.text, let institution = instNameTextFiled.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e)
                }else{
                    let profileDict = [
                        "firstname": firstname,
                        "lastname": lastname,
                        "email": email,
                        "medicalSpeciality": speciality,
                        "institution": institution]
                    
                    self.ref.child("DoctorsProfile").child(firstname).childByAutoId().setValue(profileDict) { (error, reference) in
                        if let e1 = error{
                            print(e1)
                        }
                        else {
                            print("Profile saved")
                        }
                    }
                    self.performSegue(withIdentifier: "goToHome" , sender:self)
                }
            }

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
