//
//  UserTableViewCell.swift
//  First
//
//  Created by Oleksandr on 10.07.2021.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet private var fullNameLabel: UILabel!
    @IBOutlet private var phoneNumberLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fullNameLabel.textColor =  .black
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with currentUser: User) {
        fullNameLabel.text = currentUser.fullName
        phoneNumberLabel.text = currentUser.phoneNumber
        
        if currentUser.gender == "male" {
            backgroundColor = UIColor(red: 0.46, green: 0.69, blue: 1, alpha: 1)
        } else if currentUser.gender == "female" {
            backgroundColor = .red
        }

    }
}
