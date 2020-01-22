//
//  ProfileViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 15/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//

import UIKit
import Firebase
class ProfileViewController: UIViewController {

    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var specialityLabel: UILabel!
    
    
    @IBOutlet weak var institutionLabel: UILabel!
    
    
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        loadProfile()
        // Do any additional setup after loading the view.
    }
    func loadProfile(){
        db.collection("UserInfo").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
                    self.firstNameLabel.text = document.data()["firstname"] as? String
                    self.lastNameLabel.text = document.data()["lastname"] as? String
                    self.emailLabel.text = document.data()["email"] as? String
                    self.specialityLabel.text = document.data()["medicalSpeciality"] as? String
                    self.institutionLabel.text = document.data()["institution"] as? String
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
