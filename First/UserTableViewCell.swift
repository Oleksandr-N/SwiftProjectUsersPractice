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
    @IBOutlet private var imageViewTable: UIImageView!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fullNameLabel.textColor =  .black
        
        imageViewTable.layer.cornerRadius = 5
        imageViewTable.layer.borderColor = UIColor.red.cgColor
        imageViewTable.layer.borderWidth = 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with user: User) {
        fullNameLabel.text = user.fullName
        phoneNumberLabel.text = user.phoneNumber
        imageViewTable.image = UIImage (named: user.picture)
        
        if user.gender == "male" {
            backgroundColor = UIColor(red: 0.46, green: 0.69, blue: 1, alpha: 1)
        } else if user.gender == "female" {
            backgroundColor = .red
        }

    }
}
