//
//  UserCollectionViewCell.swift
//  First
//
//  Created by Oleksandr on 27.07.2021.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var birthdayLabel: UILabel!
    @IBOutlet private var birthdayBackgroundView: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 10
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 2
        
        birthdayBackgroundView.layer.cornerRadius = 10
    }
    
    func update(with user: User, formatter: DateFormatter) {
        imageView.image = UIImage(named: user.picture)
        birthdayLabel.text = formatter.string(from: user.date)
        if user.gender == "male" {
            imageView.layer.borderColor = UIColor(red: 0.46, green: 0.69, blue: 1, alpha: 1).cgColor
        } else if user.gender == "female" {
            imageView.layer.borderColor = UIColor.red.cgColor
        }


    }
    
}
