//
//  CreatePatientViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 16/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//

import UIKit
import Firebase
class CreatePatientViewController: UIViewController {

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
        }else{
            maleCheck.isSelected = true
        }
    }
    

    @IBAction func FemaleKeyPress(_ sender: UIButton) {
        
        if maleCheck.isSelected{
            maleCheck.isSelected = false
            femaleCheck.isSelected = true
        }else{
            femaleCheck.isSelected = true
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
