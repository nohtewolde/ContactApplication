//
//  DetailVCViewController.swift
//  ContactApplication
//
//  Created by Noh Tewolde on 3/19/19.
//  Copyright © 2019 Noh Tewolde. All rights reserved.
//
//  This class inserts the contact details of a person

import UIKit

// Using Delegate to pass
protocol DetailVCDelegate: class {
    func passingContactDetail(objPerson : Person)
}

class DetailVCViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    @IBOutlet weak var txtContactName: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var imgPhoto: UIImageView!
    
    var delegate: DetailVCDelegate?
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtContactName.text = person?.name
        txtPhoneNumber.text = person?.phone
        txtEmail.text = person?.email
        imgPhoto.image = person?.photo
    }

    @IBAction func btnSubmit(_ sender: UIButton) {
        let obj : Person = Person(name: txtContactName.text!, phone: txtPhoneNumber.text!, email: txtEmail.text!, photo: imgPhoto.image!)
        delegate?.passingContactDetail(objPerson: obj)
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
