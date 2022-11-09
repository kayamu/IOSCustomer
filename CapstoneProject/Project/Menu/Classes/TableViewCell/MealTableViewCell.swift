//
//  MealTableViewCell.swift
//  HealtyMealMenu
//

// this is a customized table cell to hold and display the menu groups on the storyboard table view

import UIKit

class MealTableViewCell: UITableViewCell {
//outlets for the UI objects
    @IBOutlet weak var ingradientCalorie: UILabel!
    @IBOutlet weak var ingradientName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
