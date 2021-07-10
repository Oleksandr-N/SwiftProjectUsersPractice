//
//  DigitTableViewCell.swift
//  First
//
//  Created by Oleksandr on 10.07.2021.
//

import UIKit

class DigitTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.textColor =  .red
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
