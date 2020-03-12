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
    var ref: DatabaseReference!
        
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
        ref = Database.database().reference().child("PatientsProfile")
        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        NewKey.layer.cornerRadius = 10
        NewKey.clipsToBounds = true

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBOutlet weak var NewKey: UIButton!
    
    
    @IBAction func forNewKey(_ sender: UIButton) {
        performSegue(withIdentifier: "goToExam", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcDestination = segue.destination as? NewExaminationViewController {
            vcDestination.name = fstNameTF.text
        }
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
        if let firstname = fstNameTF.text, let lastname = lastNameTF.text,let patientId = patientID.text, let dOfBirth = dobTF.text,let recommendations = recommendTF.text, let visualActivity = visualTF.text,let assessments = AssesmentTF.text{
            let patientProDict = [
                "firstname": firstname,
                "lastname": lastname,
                "patientId": patientId,
                "dOfBirth": dOfBirth,
                //                        "left-eyeImage":*****,
                //                        "right-eyeImage":****,
                "sex":sex,
                "recommendations": recommendations,
                "visualActivity":visualActivity,
                "assessments":assessments
            ]
            self.ref.child(Auth.auth().currentUser!.uid).child("PatientsNames").childByAutoId().setValue(["Name" : firstname]) { (error, refer) in
                if let e1 = error{
                    print(e1)
                }
                else {
                    print("profile Added Successfully")
                }
            }
            
            self.ref.child(Auth.auth().currentUser!.uid).child(firstname).childByAutoId().setValue(patientProDict) { (error, reference) in
                if let e1 = error{
                    print(e1)
                }
                else {
                    print("profile details Added Successfully")
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

