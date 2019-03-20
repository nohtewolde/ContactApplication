//
//  ContactDetailCell.swift
//  ContactApplication
//
//  Created by Noh Tewolde on 3/19/19.
//  Copyright © 2019 Noh Tewolde. All rights reserved.
//

import UIKit

class ContactDetailCell: UITableViewCell {

    @IBOutlet weak var PhoneNumber: UILabel!
    @IBOutlet weak var ContactName: UILabel!
    var Email : String = String()
    var Photo : UIImage = UIImage(named: "Anna")!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
