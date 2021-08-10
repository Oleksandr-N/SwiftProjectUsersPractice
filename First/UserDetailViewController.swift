//
//  UserDetailViewController.swift
//  First
//
//  Created by Oleksandr on 27.07.2021.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var birthdayLabel: UILabel!


    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user?.fullName
        birthdayLabel.text = makeDateString()
        imageView.image = UIImage.init(named: user?.picture ?? "")

    }
    func makeBirthday() -> String {
        
        guard let user = user else {
            return ""
        }
        
        let formatter = DateFormatter.init()
//        formatter.dateStyle = .full
//        formatter.timeStyle = .full
        
        formatter.dateFormat = "MMM d, yyyy"
        
        return formatter.string(from: user.date)
    }
    
    func makeDateString() -> String {
        let date = Date()
        let otherDate = date.addingTimeInterval(60 * 60 * 48)
        let formatter = DateFormatter.init()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: otherDate)
    }
    

}
