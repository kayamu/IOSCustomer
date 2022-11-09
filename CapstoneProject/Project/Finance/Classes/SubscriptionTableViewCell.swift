//
//  SubscriptionTableViewCell.swift
//  HealthyMealFinance
//
//  Zawad Hossain
// custom cell class for holding the subscription details

import UIKit

class SubscriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblSubscription: UILabel!
    
    @IBOutlet weak var lblMenuDetail: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblMenuName: UILabel!
    
    @IBOutlet weak var lblSubscriptionDays: UILabel!
    @IBOutlet weak var lblDeliveryAddress: UILabel!
    @IBOutlet weak var lblDeliveryPerson: UILabel!
    

    var subMenu : Menus = Menus()
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


        // Configure the view for the selected state
    }

}
