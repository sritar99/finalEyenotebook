//
//  PatientReviewViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 16/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class PatientReviewViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    var name : String!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var patientIdLabel: UILabel!
    
    @IBOutlet weak var dobLabel: UILabel!
    
    @IBOutlet weak var sexlabel: UILabel!
    

    @IBOutlet weak var recommendLabel: UILabel!
    
    @IBOutlet weak var vactivityLabel: UILabel!
    
    @IBOutlet weak var assessmentsLabel: UILabel!
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Patient Review"
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        ref = Database.database().reference().child("PatientsProfile").child("sriharsha").child(name)
        
        ref.observe(.childAdded) { (snapShot) in
            let snapShotValue = snapShot.value as! Dictionary<String,String>
            self.firstNameLabel.text = snapShotValue["firstname"]!
            self.lastNameLabel.text = snapShotValue["lastname"]!
            self.patientIdLabel.text = snapShotValue["patientId"]!
            self.dobLabel.text = snapShotValue["dOfBirth"]!
            self.sexlabel.text = snapShotValue["sex"]!
            self.recommendLabel.text = snapShotValue["recommendations"]!
            self.vactivityLabel.text = snapShotValue["visualActivity"]!
            self.assessmentsLabel.text = snapShotValue["assessments"]!
        }
        
                
        
        
        // Do any additional setup after loading the view.
        
        
        
        
        
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
