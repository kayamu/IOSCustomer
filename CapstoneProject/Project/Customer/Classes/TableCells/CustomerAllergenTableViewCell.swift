//
//  CustomerAllergenTableViewCell.swift
//  HealtyMealCustomer
//
//  Derya Kaya
//  this class is a customized table cell for holding Customer allergies

import UIKit

class CustomerAllergenTableViewCell: UITableViewCell {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var ingredient : Ingredients = Ingredients()
    
    
    @IBOutlet weak var swAllergenStatus: UISwitch!
    @IBOutlet weak var lblAllergenTitle: UILabel!
    
    
    @IBAction func swActiveChange(_ sender: Any) {
        

        let i = mainDelegate.allergens.firstIndex(of: self.ingredient) ?? 0
        
        print("i value \(i)")
        
        if swAllergenStatus.isOn {
            if i == 0
            {
                self.mainDelegate.allergens.append(self.ingredient)
            }
        }
        else
        {
            if i > 0
            {
                self.mainDelegate.allergens.remove(at: i)
            }
        }
        
        print("Allergens count \(mainDelegate.allergens.count)")

    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func swAllergenIsOn(_ sender: Any) {
        
    }

}

