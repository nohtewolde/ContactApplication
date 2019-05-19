//
//  ViewController.swift
//  ContactApplication
//
//  Created by Noh Tewolde on 3/19/19.
//  Copyright © 2019 Noh Tewolde. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate,DetailVCDelegate {
    
    var per : Person?
    var isNew : Bool?
    var modified : Bool?
    var row : Int?
    var isSearching = false
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tbl: UITableView!
    var filteredData = [Person]()
    var contactList = [Person(name : "Anna", phone : "123456", email: "anna@disney.com", photo :  UIImage(named: "Anna")!), Person(name : "Belle", phone : "234567", email: "belle@disney.com", photo: UIImage(named: "Belle")!),Person(name : "Cinderella", phone : "345678", email: "cinderella@disney.com", photo: UIImage(named: "Cinderella")!), Person(name : "Diana", phone : "456789", email: "diana@nothinghampalace.com", photo: UIImage(named: "Diana")!), Person(name : "Elsa", phone : "567890", email: "elsa@disney.com", photo: UIImage(named: "Elsa")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.becomeFirstResponder()
    }
    
    func passingContactDetail(objPerson: Person, isModified: Bool, isNewContact: Bool, row: Int, section: Int){
        if isNewContact {
            contactList.append(objPerson)
        }
        else if isModified {
            contactList[row].name = objPerson.name
            contactList[row].phone = objPerson.phone
            contactList[row].email = objPerson.email
            contactList[row].photo = objPerson.photo
        }
        tbl.reloadData()
    }
    
    @IBAction func btnAddContact(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVCViewController") as? DetailVCViewController
        vc?.isNewContact = true
        //vc?.delegate = self
        
//        vc.didtapBlock = {
//            [unowned self] (obj1, obj2) in self.lblLabel.text = obj2 as? String
//        }

        vc?.contactClosure = {
            [unowned self] (obj1, obj2, obj3, obj4) in self.per = obj1 as? Person; self.isNew = obj2 as? Bool; self.modified = obj3 as? Bool; self.row = obj4 as! Int
            if self.isNew! {
                self.contactList.append(self.per!)
            }
            else if self.modified! {
                self.contactList[self.row!].name = (self.per?.name)!
                self.contactList[self.row!].phone = (self.per?.phone)!
                self.contactList[self.row!].email = (self.per?.email)!
                self.contactList[self.row!].photo = (self.per?.photo)!
            }
            self.tbl.reloadData()
            
        }
        navigationController?.pushViewController(vc!, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching{
            return filteredData.count
        }
        
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ContactDetailCell
        var obj : Person?
        if isSearching{
            obj = filteredData[indexPath.row]
        } else {
            obj = contactList[indexPath.row]
        }
        cell?.ContactName.text = obj!.name
        cell?.PhoneNumber.text = obj!.phone
        cell?.Email = obj!.email
        cell?.Photo = obj!.photo
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVCViewController") as? DetailVCViewController
        let objPerson = contactList[indexPath.row]
        vc?.person = objPerson
        vc?.row = indexPath.row
        vc?.section = indexPath.section
        vc?.isNewContact = false
        vc?.delegate = self
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            isSearching = false
            view.endEditing(true)
        } else {
            isSearching = true
            filteredData = contactList.filter({ ($0.name).range(of: searchBar.text ?? "", options:.caseInsensitive) != nil })
        }
        tbl.reloadData()
    }
}



struct Person {
    var name : String
    var phone : String
    var email : String
    var photo : UIImage
}

