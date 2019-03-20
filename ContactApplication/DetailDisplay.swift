//
//  DetailDisplay.swift
//  ContactApplication
//
//  Created by Noh Tewolde on 3/19/19.
//  Copyright © 2019 Noh Tewolde. All rights reserved.
//

//  This class simply displays the detailed information of a contact

import UIKit

class DetailDisplay: UIViewController{

    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var imgPhoto: UIImageView!

    var objPerson : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = objPerson?.name
        lblPhone.text = objPerson?.phone
        lblEmail.text = objPerson?.email
        imgPhoto.image = objPerson?.photo
    }
}
