//
//  ViewController.swift
//  ApiAlamoFire
//
//  Created by Ayush kakdiya on 02/02/23.
//

import UIKit
import SwiftUI
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arrUser: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func getUsers() {
        AF.request("https://gorest.co.in/public/v2/users").responseData { response in
            debugPrint("response: \(response)")

            guard let apidata = response.data else { return }
            do {
                self.arrUsers = try JSONDecoder () .decode ([User].self, from: apiData)
                self.usersTableView.reloadData()
//                self.arrUsers = try JSONDecoder () .decode ([User].self, from: apidata)
//                self.usersTableView.reloadData()
            } catch {
                print("passing error")
            }
        }
    }
}

extension ViewController: UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrUser.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let rowDictionary = arrUser[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}


struct User {
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
}
