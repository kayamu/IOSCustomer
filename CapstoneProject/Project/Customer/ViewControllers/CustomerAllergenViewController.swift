//
//  CustomerAllergenViewController.swift
//  HealtyMealCustomer
//
//  Derya Kaya
// this class displays the list of allergens and from where user can select and unselect any allergies
// in a custom table
// also getting info from the webservices and also saving them when there are changes
//

import UIKit

class CustomerAllergenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
   
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var allergens : [Ingredients] = []
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var customerHealth : CustomerHealthsWithIndredients = CustomerHealthsWithIndredients()
    

    
    @IBAction func unwindToTableViewController(sender: UIStoryboardSegue){
        
    }
    
    
    // event handler method to segue to allergentomenu controller
// get healthdata info
    @IBAction func btnNextAction(_ sender: Any) {
        
        self.getCustomerHealthDataWithIngredients(id: self.customerHealth.id ?? 0)
        self.performSegue(withIdentifier: "AllergenToMenu", sender: nil)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customerHealth.id = mainDelegate.customer.customerHealths[0].id
        
        getAllergensData()
        
    }
    
    func getAllergensData()
    {
        let defaults = UserDefaults.standard
  
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        Webservice().getIngredients(token: token) { (result) in
            switch result {
            case .success(let items):
                DispatchQueue.main.async {
                    self.allergens = items
                    print("*****************************************************")
                    print("Allergens Received")
                    print("*****************************************************")
                    
                   
                    
                    self.tableView.reloadData()
                }
            case .failure(_):
                print("Couldnt Get Health Data")
            }
        }
        
        
        
        
    }
    
    func getCustomerHealthDataWithIngredients(id : Int){
        
        let defaults = UserDefaults.standard
  
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        Webservice().getCustomerHealthWithIngredientsByID(token: token, id:id ) { (result) in
            switch result {
            case .success(let item):
                DispatchQueue.main.async {
                    self.customerHealth = item
                    print("*****************************************************")
                    print(item.id ?? 0)
                    print("*****************************************************")
                    
                    
                    self.customerHealth.ingredients.removeAll()
                    
                    for item in self.mainDelegate.allergens
                    {
                        self.customerHealth.ingredients.append(item)
                    }
                    
                    self.setCustomerHealthData()
                    
                }
            case .failure(_):
                print("Couldnt Get Health Data")
            }
        }
    }
    
    
    func setCustomerHealthData(){
        
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        Webservice().customerHealthsWithIndredientsById (token: token, item: customerHealth, id: customerHealth.id ?? 0, httpType: .put){
            (result) in
                switch result {
                case .success(let cHealth):
                    print("Health data saved")
                case .failure(let error):
                     print(error.localizedDescription)
                }
           }
        
        
        
        
        
    }
    
    
    
//    var allergens = ["strawbery", "apple", "bananna", "orange", "letuce", "patato"]
//    var allergensStatus = [true, true, false, true, false, false]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allergens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell (withIdentifier:
            "myCell", for: indexPath) as? CustomerAllergenTableViewCell ??
                                          CustomerAllergenTableViewCell(style: .default,
                                                                        reuseIdentifier:"myCell")
        cell.backgroundColor = .clear
           
        
        
//        let row = indexPath.row
//        let rowData = (getData.dbData?[row])! as NSDictionary
        
        let row = indexPath.row
        
        print(row)
        let allergenTitle = String(allergens[row].name) as String
        let allergenStatus = false

        
        cell.ingredient = allergens[row]
        cell.lblAllergenTitle.text = allergenTitle
        cell.swAllergenStatus.setOn(allergenStatus, animated: true)
        
        return cell
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

