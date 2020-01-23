//
//  NotesViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 16/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class NotesViewController: UIViewController {
    var ref: DatabaseReference!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
            ref = Database.database().reference()
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
