//
//  PatientsViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 15/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//
import Firebase
import Foundation
import UIKit
import FirebaseDatabase
class LocalReviewsViewController: UIViewController, UITableViewDelegate {
    var ref: DatabaseReference!
        
    var name : String!
    
    var list :[PatientsList] = [
     PatientsList(patientId: "abcde", body: "john"),
    ]
    
    @IBOutlet weak var patientsTable: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Patients"
        patientsTable.dataSource = self
        patientsTable.delegate = self
        patientsTable.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        ref = Database.database().reference().child("PatientsProfile").child("sriharsha").child("PatientsNames")
        
        ref.observe(.childAdded) { (snapshot) in
            let snapshotVal = snapshot.value as! Dictionary<String,String>
            self.list.append(PatientsList(patientId: "123", body: snapshotVal["Name"]!))
            self.patientsTable.reloadData()
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
    
    
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // go to show patients review details that are retrived from database by performing segues
        
        let number = indexPath.row
        name = list[number].body
        performSegue(withIdentifier: "goToReview", sender: self)
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcDestinationn = segue.destination as? PatientReviewViewController {
            vcDestinationn.name = name
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension LocalReviewsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        as! ListCell
        cell.idLabel.text = list[indexPath.row].patientId
        cell.bodyLabel.text = list[indexPath.row].body
        return cell
    }
    

    
    
}



