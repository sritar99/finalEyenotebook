//
//  CreatePatientViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 16/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class CreatePatientViewController: UIViewController {
    var ref: DatabaseReference! = Database.database().reference().child("PatientsProfile")
    var gender = "Male"
    @IBOutlet weak var fstNameTF: UITextField!
    
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    
    @IBOutlet weak var patientID: UITextField!
    
    
    @IBOutlet weak var dobTF: UITextField!
    
    
    @IBOutlet weak var recommendTF: UITextField!
    
    
    @IBOutlet weak var visualTF: UITextField!
    
    @IBOutlet weak var AssesmentTF: UITextField!
    
    @IBOutlet weak var maleCheck: UIButton!
    
    @IBOutlet weak var femaleCheck: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Patient"

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func MaleKeyPress(_ sender: UIButton) {
        
        if femaleCheck.isSelected{
            femaleCheck.isSelected = false
            maleCheck.isSelected = true
            gender = "Male"
            
        }else{
            maleCheck.isSelected = true
            gender = "Male"
        }
    }
    

    @IBAction func FemaleKeyPress(_ sender: UIButton) {
        
        if maleCheck.isSelected{
            maleCheck.isSelected = false
            femaleCheck.isSelected = true
            gender = "FeMale"
        }else{
            femaleCheck.isSelected = true
            gender = "FeMale"
        }
    }
    
    

    @IBAction func createSaveKey(_ sender: UIBarButtonItem) {
        let sex = gender
        if let firstname = fstNameTF.text, let lastname = lastNameTF.text,let patientId = patientID.text, let dOfBirth = dobTF.text,let recommendations = recommendTF.text, let visualActivity = visualTF.text{
            let patientProDict = [
                "firstname": firstname,
                "lastname": lastname,
                "patientId": patientId,
                "dOfBirth": dOfBirth,
                //                        "left-eyeImage":*****,
                //                        "right-eyeImage":****,
                "sex":sex,
                "recommendations": recommendations,
                "visualActivity":visualActivity
            ]
            
            self.ref.child(firstname).childByAutoId().setValue(patientProDict) { (error, reference) in
                if let e1 = error{
                    print(e1)
                }
                else {
                    print("Patient profile Added Successfully")
                }
            }
            
            navigationController?.popViewController(animated: true)

        
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

