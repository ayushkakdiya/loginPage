//
//  ListOfStudantsViewController.swift
//  DataBase
//
//  Created by Ayush kakdiya on 13/02/23.
//

import UIKit

class ListOfStudantsViewController: UIViewController {

    @IBOutlet weak var employeeTableView: UITableView!
    var arrStudants: [Studants] = []
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


extension ListOfStudantsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let Studants = arrStudants[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = ""
        return cell
    }
}
