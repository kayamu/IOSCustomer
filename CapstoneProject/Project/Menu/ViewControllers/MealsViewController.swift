//
//  MealsViewController.swift
//  HealtyMealMenu
//
//  Mamona Ghaffar
// this class displays the meals and information in a tabular form

import UIKit

class MealsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //outlets for UIobejcts
    @IBOutlet weak var lblPrice: UILabel!
   @IBOutlet weak var lblCalorie: UILabel!
    @IBOutlet weak var lblDeatil: UILabel!
   //arrays to hold the ingredients and calorie information
 var ingradients = ["strawbery", "apple", "bananna", "orange", "letuce", "patato"]
    var calories = [300, 400, 200, 100, 500, 400]
    
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    //displaying the customized cell for the meal
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell (withIdentifier: "mealCell", for: indexPath) as? MealTableViewCell ??
                                                        MealTableViewCell(style: .default, reuseIdentifier:"mealCell")
        cell.backgroundColor = .clear
                                                                                                                                   
        let row = indexPath.row
        let ingradient = String(ingradients[row]) as String
        let calorie = String(calories[row]) as String
                             
        cell.ingradientName.text = ingradient
        cell.ingradientCalorie.text = calorie

        
                                                                                                                                                                                                 
        return cell
        
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
        
    }
    
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblPrice.text = "10.49$"
        lblCalorie.text = "1500"
        lblDeatil.text = "Roasted lamb (~600gr) sitting on a bed of aromatic Basmati Rice with the option of fried onions, almonds and raisins on top."

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

