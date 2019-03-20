//
//  DetailDisplay.swift
//  ContactApplication
//
//  Created by Noh Tewolde on 3/19/19.
//  Copyright © 2019 Noh Tewolde. All rights reserved.
//

import UIKit

class DetailDisplay: UIViewController{

    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var imgPhoto: UIImageView!
    
    var name : String = String()
    var phone : String = String()
    var email : String = String()
    var photo : UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = name
        lblPhone.text = phone
        lblEmail.text = email
        imgPhoto.image = photo
    }
}
