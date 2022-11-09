//
//  ReviewTableViewCell.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-04-20.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var lblHeading: UILabel!
    
    @IBOutlet weak var lblRaiting: UILabel!
    
    
    @IBOutlet weak var lblReview: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
