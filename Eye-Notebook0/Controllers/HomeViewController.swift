//
//  HomeViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 15/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class HomeViewController: UIViewController {

    var ref: DatabaseReference! 
    @IBOutlet weak var currentUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.hidesBackButton = true
        title = "Eye-notebook"
        navigationItem.hidesBackButton = true
        ref = Database.database().reference()
        
        currentUserLabel.text = Auth.auth().currentUser?.email
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func logOutKeyPress(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
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
