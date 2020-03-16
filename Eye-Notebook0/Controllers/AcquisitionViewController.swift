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
import Kingfisher
class AcquisitionViewController: UIViewController {
    var ref: DatabaseReference!
    var name : String!
    var LeftImage:String!
    var RightImage:String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Acquisitions"
        // Do any additional setup after loading the view.
        
//        ref = Database.database().reference().child("EyeImagesCollection").child("sriharsha").child(name)
//
//        var LImageModel: ImageModel?{
//            didSet{
//                let url = URL(string: LImageModel!.leftImageUrl!)
//                KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil) {(image, error, cache, imageURL) in
//                    self.leftImage.image = image
//                }
//            }
//        }
//
//        var RImageModel: RImageModel?{
//            didSet{
//                let url = URL(string: RImageModel!.rightImageUrl!)
//                KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil) { (image, error, cache, imageURL) in
//                    self.rightImage.image = image
//                }
//            }
//        }
        
        var url = URL(string: LeftImage)
        KingfisherManager.shared.retrieveImage(with: url!, options: nil, progressBlock: nil) {(image, error, cache, imageURL) in
            self.leftImage.image = image
        }

        var anotherurl = URL(string: RightImage)
        KingfisherManager.shared.retrieveImage(with: url!, options: nil, progressBlock: nil) {(image, error, cache, imageURL) in
            self.rightImage.image = image
        }
        
    }
        
        
    
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var leftImage: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
