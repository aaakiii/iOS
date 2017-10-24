//
//  TableViewCell.swift
//  DeathNote
//
//  Created by 岡田暁 on 2017-10-24.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit

class DeathTableViewCell: UITableViewCell {

    @IBOutlet weak var eyeColorView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(age: Int16, name: String, eyeColor:  UIColor){
        ageLabel.text = String(age)
        nameLabel.text = name
        eyeColorView.backgroundColor  = eyeColor
    }

}
