//
//  CreationViewController.swift
//  Finden
//
//  Created by Alan Cao on 4/18/20.
//  Copyright © 2020 Finden. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class CreationViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet var createImageView: UIImageView!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createImageView.layer.masksToBounds = true
        createImageView.layer.cornerRadius = 20
        descriptionTextView.layer.cornerRadius = 4
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 500, height: 500)
        let scaledImage = image.af_imageScaled(to: size)
        
        createImageView.image = scaledImage
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        let imageData = createImageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        let post = PFObject(className: "Posts")
        post["title"] = titleTextField.text!
        post["description"] = descriptionTextView.text!
        post["location"] = locationTextField.text!
        post["eventDate"] = dateTextField.text!
        post["image"] = file
        
        // post["author"] = PFUser.current()!
        
        post.saveInBackground { (success, error) in
            if success {
                print("Saved.")
            } else {
                print(error?.localizedDescription ?? "Error")
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
}
