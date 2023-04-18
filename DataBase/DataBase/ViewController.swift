//
//  ViewController.swift
//  DataBase
//
//  Created by Ayush kakdiya on 08/02/23.
//

import UIKit
import FMDB

class ViewController: UIViewController {


    @IBOutlet weak var serchButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var lastNameTextFilde: UITextField!
    @IBOutlet weak var FirstNameTxtFeld: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func addButtonAction(_ sender: UIButton) {
        if FirstNameTxtFeld.text?.count == 0 || lastNameTextFilde.text?.count == 0 {
            displayValidation(massage: "Plese Enter Missing Details")
//            print("plese Enter Missing Details")
            return
        }
        
        let qury = "INSERT INTO emp (name, address) VALUES ('\(FirstNameTxtFeld.text ?? "")','\(lastNameTextFilde.text ?? "")');"
        print(qury)
        let databaseObject = FMDatabase(path: AppDelegate.dataBasPath)
        if databaseObject.open() {
            let result = databaseObject.executeStatements(qury)
            if result == false {
                FirstNameTxtFeld.text = ""
                lastNameTextFilde.text = ""
                displayValidation(massage: "Tamaro Data Save")
            } else {
                displayValidation(massage: "Tame Kyak Locho Marelo")
            }
        }
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        if FirstNameTxtFeld.text?.count == 0 || lastNameTextFilde.text?.count == 0 {
            print("plese Enter Missing Details")
            return
        }
        
        let qury = "INSERT INTO emp (name, address) VALUES ('\(FirstNameTxtFeld.text ?? "")','\(lastNameTextFilde.text ?? "")');"
        print(qury)
        let databaseObject = FMDatabase(path: AppDelegate.dataBasPath)
        if databaseObject.open() {
            let result = databaseObject.executeStatements(qury)
            if result == false {
                FirstNameTxtFeld.text = ""
                lastNameTextFilde.text = ""
               displayValidation(massage: "Tamaro Data Delete")
            } else {
              displayValidation(massage: "Tame Kyak Locho Marelo")
            }
        }
    }
    
    @IBAction func updateButtonAction(_ sender: UIButton) {
        if FirstNameTxtFeld.text?.count == 0 || lastNameTextFilde.text?.count == 0 {
            print("plese Enter Missing Details")
            return
        }
        
        let qury = "INSERT INTO emp (name, address) VALUES ('\(FirstNameTxtFeld.text ?? "")','\(lastNameTextFilde.text ?? "")');"
        print(qury)
        let databaseObject = FMDatabase(path: AppDelegate.dataBasPath)
        if databaseObject.open() {
            let result = databaseObject.executeStatements(qury)
            if result == false {
                FirstNameTxtFeld.text = ""
                lastNameTextFilde.text = ""
                displayValidation(massage: "Tamaro Data update thai gayo")
            } else {
                displayValidation(massage: "Tame Kyak Locho Marelo")
            }
        }
    }
    
    @IBAction func serchButtonAction(_ sender: UIButton) {
       
    }
    
    func displayValidation(massage: String) {
        
        let alert: UIAlertController = UIAlertController(title: "Data ", message: massage, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default) { button in }
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}

struct Studants {
    var name: String
    var address: String
}
