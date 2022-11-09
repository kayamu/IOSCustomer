//
//  MenuGroupTableViewCell.swift
//  HealtyMealMenu
//
// Mamona Ghaffar
// this is a customized table cell to hold and display the menu on the storyboard table view

import UIKit

class MenuGroupTableViewCell: UITableViewCell {
//outlet for the UI objects
    @IBOutlet weak var imgMenu: UIImageView!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblCalorie: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblMenuName: UILabel!
    //maindelegate object
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var menu : Menus = Menus()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //event handler method to handle when the subscribe button is clicked
    @IBAction func btnSubscribeAction(_ sender: Any) {
        mainDelegate.subscribedMenus.append(menu)
        print("Subscribed menu count: \(self.mainDelegate.subscribedMenus.count)")
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

