//
//  CustomerContactsTableViewCell.swift
//  CapstoneProject
//
//  Derya Kaya.
// this class is a customized table cell for holding Customer contacts

import UIKit

class CustomerContactsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var swActive: UISwitch!
    @IBOutlet weak var lblContactName: UILabel!
    @IBOutlet weak var lblFullAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

