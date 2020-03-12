//
//  ProfileViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 15/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class ProfileViewController: UIViewController {

    var ref: DatabaseReference!
        
    @IBOutlet weak var firstNameLabel: UILabel!
    
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var specialityLabel: UILabel!
    
    
    @IBOutlet weak var institutionLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        ref = Database.database().reference().child("DoctorsProfile").child(Auth.auth().currentUser!.uid)
        
        
        ref.observe(.childAdded) { (snapShot) in
            let snapShotValue = snapShot.value as! Dictionary<String,String>
            self.institutionLabel.text = snapShotValue["institution"]!
            self.firstNameLabel.text = snapShotValue["firstname"]!
            self.lastNameLabel.text = snapShotValue["lastname"]!
            self.emailLabel.text = snapShotValue["email"]!
            self.specialityLabel.text = snapShotValue["medicalSpeciality"]!
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
