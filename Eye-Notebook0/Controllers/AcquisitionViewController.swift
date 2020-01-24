//
//  AcquisitionViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 23/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import Foundation
import FirebaseStorage
class AcquisitionViewController: UIViewController {
    var ref: DatabaseReference!
    var name : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Acquisitions"
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference().child("EyeImagesCollection").child("sriharsha").child(name)
        
        
        
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
