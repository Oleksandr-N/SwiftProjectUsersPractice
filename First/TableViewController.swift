//
//  TableViewController.swift
//  First
//
//  Created by Oleksandr on 06.07.2021.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    //var tableData: [String] = []
    struct NumberNames {
        
        let digit: Int
        let name: String
        
    }
    
    
    var numberNamesArray: [NumberNames] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
      //  tableData = ["1", "2", "3"]
        numberNamesArray = [
            NumberNames.init(digit: 1, name: "ONE"),
            NumberNames.init(digit: 2, name: "TWO"),
            NumberNames.init(digit: 3, name: "THREE"),
            NumberNames.init(digit: 4, name: "FOUR")
        ]
    }
    
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberNamesArray.count
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
//        let number = numberNamesArray[indexPath.row]
//        cell.textLabel?.text = String(number.digit)
//        cell.detailTextLabel?.text = number.name
//        print("Section = \(indexPath.section), Row = \(indexPath.row)")
//        return cell
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DigitCell", for: indexPath) as! DigitTableViewCell
        let number = numberNamesArray[indexPath.row]
        cell.titleLabel.text = String(number.digit)
        print("Section = \(indexPath.section), Row = \(indexPath.row)")
        return cell
    }
    

    
}
