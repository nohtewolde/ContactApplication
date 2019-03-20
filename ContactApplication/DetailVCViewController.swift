//
//  DetailVCViewController.swift
//  ContactApplication
//
//  Created by Noh Tewolde on 3/19/19.
//  Copyright © 2019 Noh Tewolde. All rights reserved.
//

import UIKit

// Using Delegate to pass
@objc protocol DetailVCDelegate: class {
    func passingStringValue(name : String, number : String, email: String, photo: UIImage)
}

class DetailVCViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    @IBOutlet weak var txtContactName: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var imgPhoto: UIImageView!
    
    var delegate: DetailVCDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnSubmit(_ sender: UIButton) {
        delegate?.passingStringValue(name: txtContactName.text!, number: txtPhoneNumber.text!, email: txtEmail.text!, photo: imgPhoto.image!)
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnChoosePhoto(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose Source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgPhoto.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
