//
//  TableViewController.swift
//  First
//
//  Created by Oleksandr on 06.07.2021.
//

import UIKit

struct User: Decodable {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let gender: String
    let picture: String
    
    var fullName: String  {
        firstName + " " + lastName
    }
}

class TableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    
    var usersArray: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
      
        usersArray = getUsersList()

    }
    
    func getUsersList() -> [User] {

            if let path = Bundle.main.path(forResource: "users", ofType: "json") {

                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let users: [User] = try decoder.decode([User].self, from: data)

                    return users
                } catch {
                    print(error)
                    // handle error
                    return []
                }
            }

            return []
        }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCellID", for: indexPath) as! UserTableViewCell
        let currentUser = usersArray[indexPath.row]
//        cell.fullNameLabel.text = currentUser.firstName + " " + currentUser.lastName
//        cell.phoneNumberLabel.text = user.phoneNumber
//        print("Section = \(indexPath.section), Row = \(indexPath.row)")
//        //        cell.backgroundColor = .green
//        if user.gender == "male" {
//            cell.backgroundColor = UIColor(red: 0.46, green: 0.69, blue: 1, alpha: 1)
//        } else if user.gender == "female" {
//            cell.backgroundColor = .red
//        }
        cell.update(with: currentUser)
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Did select: Section")
        tableView.deselectRow(at: indexPath, animated: true)
        if let viewController = storyboard?.instantiateViewController(
            identifier: "UserDetailViewController") as? UserDetailViewController {
            
            let user = usersArray[indexPath.row]
            viewController.user = user
            navigationController?.pushViewController(viewController, animated: true)
        }
        
    }
}

