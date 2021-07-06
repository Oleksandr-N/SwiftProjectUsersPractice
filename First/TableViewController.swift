//
//  TableViewController.swift
//  First
//
//  Created by Oleksandr on 06.07.2021.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var tableData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableData = ["1", "2", "3"]
    }

}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellID", for: indexPath)
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text  =  tableData[indexPath.row]
        print("Section = \(indexPath.section), Row = \(indexPath.row)")
        return cell
    }
    

    
}
