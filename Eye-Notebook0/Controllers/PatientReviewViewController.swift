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
    var arrData = [ImageModel]()
    var arrData1 = [RImageModel]()
    var name : String!
    var Lurl:String!
    var Rurl:String!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var patientIdLabel: UILabel!
    
    @IBOutlet weak var dobLabel: UILabel!
    
    @IBOutlet weak var sexlabel: UILabel!
    

    @IBOutlet weak var recommendLabel: UILabel!
    
    @IBOutlet weak var vactivityLabel: UILabel!
    
    @IBOutlet weak var assessmentsLabel: UILabel!
    
    
    @IBAction func KeyPress(_ sender: UIButton) {
    }
    
    @IBOutlet weak var AcqKey: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Patient Review"
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        AcqKey.layer.cornerRadius = 10
        AcqKey.clipsToBounds = true

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        ref = Database.database().reference().child("PatientsProfile").child(Auth.auth().currentUser!.uid).child(name)
        
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
                
        ref = Database.database().reference().child("EyeImagesCollection").child(Auth.auth().currentUser!.uid).child("EyeImages")
//        func getAllFIRData(){
            self.ref.queryOrderedByKey().observe(.value) { (snapshot) in
                self.arrData.removeAll()
                if let snapShot = snapshot.children.allObjects as? [DataSnapshot]{
                    for snap in snapShot{
                        if let mainDict = snap.value as? [String:AnyObject]{
                            let name = mainDict["name"] as? String
                            let leftImageUrl = mainDict["leftImageUrl"] as? String ?? ""
                            self.arrData.append(ImageModel(name: name!,leftImageUrl: leftImageUrl))
                            self.Lurl = leftImageUrl
                            print(leftImageUrl)
                        }
                    }
                }
            }
//        }
        // Do any additional setup after loading the view.
        ref = Database.database().reference().child("EyeImagesCollection").child(Auth.auth().currentUser!.uid).child("EyeImages")
        self.ref.queryOrderedByKey().observe(.value) { (snapshot) in
            self.arrData1.removeAll()
            if let snapShot = snapshot.children.allObjects as? [DataSnapshot]{
                for snap in snapShot{
                    if let mainDict = snap.value as? [String:AnyObject]{
                        let name = mainDict["name"] as? String
                        let rightImageUrl = mainDict["rightImageUrl"] as? String ?? ""
                        self.arrData1.append(RImageModel(name: name!, rightImageUrl: rightImageUrl))
                        self.Rurl = rightImageUrl
                        print(rightImageUrl)
                    }
                }
            }
        }
        
        
    }
    

    
    @IBAction func acKey(_ sender: UIButton) {
        performSegue(withIdentifier: "goToImages", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcDestination = segue.destination as? AcquisitionViewController {
            vcDestination.LeftImage = self.Lurl
            vcDestination.RightImage = self.Rurl
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
