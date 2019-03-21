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
    func passingContactDetail(objPerson : Person, isModified : Bool, isNewContact: Bool, row: Int, section: Int)
}

class DetailVCViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    @IBOutlet weak var txtContactName: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var imgPhoto: UIImageView!
    
    var delegate: DetailVCDelegate?
    var person: Person?
    var isNewContact : Bool? = Bool()       // If contact is new then add it to the list of contacts
    var row : Int? = Int()                  // If it is existing contact keep its row and section data ...
    var section : Int? = Int()              // for potential modification
    var originalName : String? = String()
    var originalPhoneNumber : String? = String()
    var originalEmail  : String? = String()
    var originalPhoto : UIImage? = UIImage()
    var modified : Bool = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtContactName.text = person?.name
        txtPhoneNumber.text = person?.phone
        txtEmail.text = person?.email
        imgPhoto.image = person?.photo
        
        if !(isNewContact)! {
            originalName = person?.name
            originalPhoneNumber = person?.phone
            originalEmail = person?.email
            originalPhoto = person?.photo
        }
    }

    @IBAction func btnSubmit(_ sender: UIButton) {
        let obj : Person = Person(name: txtContactName.text!, phone: txtPhoneNumber.text!, email: txtEmail.text!, photo: imgPhoto.image!)
        if !isNewContact! {
            modified = !(originalName == txtContactName.text && originalPhoneNumber == txtPhoneNumber.text && originalEmail == txtEmail.text && originalPhoto == imgPhoto.image )
        }else if isNewContact!{
            modified = false
        }
            print("Modified is : \(modified)")
        
        delegate?.passingContactDetail(objPerson: obj, isModified: modified, isNewContact: isNewContact!, row: row!, section: section!)
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
