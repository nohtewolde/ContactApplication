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
    var contactList = [Person(name : "Anna", phone : "123456"), Person(name : "Bella", phone : "234567"),Person(name : "Cendrella", phone : "345678"), Person(name : "Diana", phone : "456789"), Person(name : "Elsa", phone : "567890")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func passingStringValue(name: String, number: String) {
        contactList.append(Person(name: name, phone: number))
        print("In VC \(name)")
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
        let c = tbl.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ContactDetailCell
        
        c?.ContactName.text = contactList[indexPath.row].name
        c?.PhoneNumber.text = contactList[indexPath.row].phone
        return c!
    }



}



struct Person {
    var name : String = String()
    var phone : String = String()
    init(name : String, phone : String){
        self.name = name
        self.phone = phone
    }
}

