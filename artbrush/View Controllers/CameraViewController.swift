//
//  CameraViewController.swift
//  artbrush
//
//  Created by Tony Dam on 06/07/2020.
//  Copyright © 2020 TonyDam. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

class CameraViewController: UIViewController {
    
    // Mark: Outlets
    
    @IBOutlet weak var stackStepTuto: UIStackView!
    @IBOutlet weak var stepAddPicture: UIButton!
    @IBOutlet weak var stepAddStep: UIView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    
    
    // Mark: Properties
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleSelectPhoto))
        photo.addGestureRecognizer(tapGesture)
        photo.isUserInteractionEnabled = true
        

    }
    
    
    
    // Mark: Functions
    
    func setUpElements() {
        stackStepTuto.alpha = 0
        stepAddStep.alpha = 0
        Utilities.styleFilledButton(stepAddPicture)
    }
    
    @objc func handleSelectPhoto() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
    func sendDataToDatabase() {
        let ref = Database.database().reference()
        let usersReference = ref.child("users")
        let newUserReference = usersReference.child(uid)
        newUserReference.setValue(["username": username, "email": email, "profilImageUrl": profileImageUrl])
    }
    
    
    
    // Mark: Actions
    
    @IBAction func shareButton_TouchUpInside(_ sender: Any) {
        if let profileImg = self.selectedImage, let imageData = UIImageJPEGRepresentation(profileImg, 0.1) {
            let photoIdString = NSUUID(),uuidString
            let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOF_REF).child("posts").child(photoIdString)
            storageRef.put(imageData, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    return
                }
                let photoUrl = metadata?.downloadURL()?.absoluteString
                self.sendDataToDatabase()
            })
        }
    }
    
    @IBAction func stepSwitcher(_ sender: UISwitch) {
        if (sender.isOn == true) {
            stackStepTuto.alpha = 1
            stepAddStep.alpha = 1
        } else {
            stackStepTuto.alpha = 0
            stepAddStep.alpha = 0
        }
    }
    
    

}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Choix du média terminer")
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectedImage = image
            photo.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
