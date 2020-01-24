//
//  NewExaminationViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 16/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseStorage
class NewExaminationViewController: UIViewController {
        
    var name : String!
    var ref: DatabaseReference!
    @IBOutlet weak var leftEyeImage: UIImageView!
    
    
    
    @IBOutlet weak var rightEyeImage: UIImageView!
    
    @IBOutlet weak var saveKey: UIButton!
    

    let picker = UIImagePickerController()
    
    var flag = 1
//    var whichImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(name!)
        ref = Database.database().reference().child("EyeImagesCollection")
        
        title = "New Examination"
        
        picker.delegate = self
        
        let lefttapGesture = UITapGestureRecognizer()
        lefttapGesture.addTarget(self, action: #selector(NewExaminationViewController.openGallery(lefttapGesture:)))
        leftEyeImage.isUserInteractionEnabled = true
        leftEyeImage.addGestureRecognizer(lefttapGesture)
        
        
        let rightttapGesture = UITapGestureRecognizer()
        rightttapGesture.addTarget(self, action: #selector(NewExaminationViewController.openGallery(righttapGesture:)))
        rightEyeImage.isUserInteractionEnabled = true
        rightEyeImage.addGestureRecognizer(rightttapGesture)

        saveKey.layer.cornerRadius = 10
        saveKey.clipsToBounds = true
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func openGallery(lefttapGesture: UITapGestureRecognizer){
        flag = 1
        self.setupImagePicker()
        
    }
    
    @objc func openGallery(righttapGesture: UITapGestureRecognizer){
        flag = 0
        self.setupImagePicker()
    }

    
    @IBAction func saveKeyPress(_ sender: UIButton) {

        

        self.uploadLImage(self.leftEyeImage.image!){ url in
        
                        self.saveLImage(name: self.name, leftImageUrl: url!){ success in
                            if success != nil{
                                print("left Image is uploaded")
                            }
                        }
        
                }
        
        
        
                self.uploadRImage(self.rightEyeImage.image!){ url in
        
                        self.saveRImage(name: self.name, rightImageUrl: url!){ success in
                            if success != nil{
                                print("Right Image is uploaded")
                            }
                        }
        
                }
        navigationController?.popViewController(animated: true)
        print("saved FIRData")
    }
    
    
//    func saveFIRdata(){
//        self.uploadLImage(leftEyeImage.image!){ url in
//
//                self.saveLImage(name: self.name, leftImageUrl: url!){ success in
//                    if success != nil{
//                        print("left Image is uploaded")
//                    }
//                }
//
//        }
        
//        self.uploadRImage(self.rightEyeImage.image!){ url in
//
//                self.saveRImage(name: self.name, rightImageUrl: url!){ success in
//                    if success != nil{
//                        print("Right Image is uploaded")
//                    }
//                }
//
//        }

//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


// this is for getting image from gallery when tapped on the imageIcon
extension NewExaminationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func setupImagePicker(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            picker.sourceType = .savedPhotosAlbum
            picker.delegate = self
            picker.isEditing = true
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        if self.flag == 1{
            leftEyeImage.image = image
            self.dismiss(animated: true, completion: nil)
        }else{
            rightEyeImage.image = image
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}







//this it for uploading of image to firebase Storage
extension NewExaminationViewController{
    func uploadLImage(_ image:UIImage, completion: @escaping (_ url:URL?) -> ()){
        let storageRef = Storage.storage().reference().child("\(self.name)/leftEyeImage")
        let imgData = leftEyeImage.image?.pngData()
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storageRef.putData(imgData!, metadata: metaData) { (metadata, error) in
            if error == nil{
                print("Left Eye Image Successfully uploaded ")
                storageRef.downloadURL(completion: { (url, error) in
                    completion(url!)
                })
            }else{
                print("Error in saving image")
                completion(nil)
            }
        }
        
    }
    func uploadRImage(_ image:UIImage, completion: @escaping ((_ url:URL?) -> ())){
        let storageRef = Storage.storage().reference().child("\(self.name)/rightEyeImage")
        let imgData = rightEyeImage.image?.pngData()
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storageRef.putData(imgData!, metadata: metaData) { (metadata, error) in
            if error == nil{
                print("Right Eye Image Successfully uploaded")
                storageRef.downloadURL(completion: { (url, error) in
                    completion(url!)
                })
            }else{
                print("Error in saving image")
                completion(nil)
            }
        }

    }
    
    func saveLImage(name: String, leftImageUrl: URL,completion: @escaping ((_ url:URL?) -> ())){
        let dict = ["name":name, "leftImageUrl":leftImageUrl.absoluteString] as [String: Any]
        
        self.ref.child("sriharsha").child("EyeImages").childByAutoId().setValue(dict) { (error, refer) in
            if let e1 = error{
                print(e1)
            }
            else {
                print("EyeImage profile Added Successfully")
            }
        }
        
    }
    
    func saveRImage(name: String, rightImageUrl: URL,completion: @escaping ((_ url:URL?) -> ())){
        let dict = ["name":name,"rightImageUrl":rightImageUrl.absoluteString] as [String: Any]

        self.ref.child("sriharsha").child("EyeImages").childByAutoId().setValue(dict) { (error, refer) in
            if let e1 = error{
                print(e1)
            }
            else {
                print("EyeImage profile Added Successfully")
            }
        }

    }
}

