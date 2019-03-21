//
//  ViewController.swift
//  ContactApplication
//
//  Created by Noh Tewolde on 3/19/19.
//  Copyright © 2019 Noh Tewolde. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetailVCDelegate {
    
    @IBOutlet weak var tbl: UITableView!
    var contactList = [Person(name : "Anna", phone : "123456", email: "anna@disney.com", photo :  UIImage(named: "Anna")!), Person(name : "Belle", phone : "234567", email: "belle@disney.com", photo: UIImage(named: "Belle")!),Person(name : "Cinderella", phone : "345678", email: "cinderella@disney.com", photo: UIImage(named: "Cinderella")!), Person(name : "Diana", phone : "456789", email: "diana@nothinghampalace.com", photo: UIImage(named: "Diana")!), Person(name : "Elsa", phone : "567890", email: "elsa@disney.com", photo: UIImage(named: "Elsa")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func passingContactDetail(objPerson: Person) {
        contactList.append(objPerson)
        tbl.reloadData()
    }
    
    @IBAction func btnAddContact(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVCViewController") as? DetailVCViewController
        vc?.delegate = self
        navigationController?.pushViewController(vc!, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ContactDetailCell
        let obj = contactList[indexPath.row]
        cell?.ContactName.text = obj.name
        cell?.PhoneNumber.text = obj.phone
        cell?.Email = obj.email
        cell?.Photo = obj.photo
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVCViewController") as? DetailVCViewController
        let objPerson = contactList[indexPath.row]
        vc?.person = objPerson
        vc?.delegate = self
        navigationController?.pushViewController(vc!, animated: true)

    }
}



struct Person {
    var name : String
    var phone : String
    var email : String
    var photo : UIImage
}

