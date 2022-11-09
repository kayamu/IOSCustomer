//
//  SubscriptionViewController.swift
//  HealthyMealFinance
//
//  Zawad Hossain
// this class displays the subscriptions details in table format
//getting info from Maindelegate and updating accordingly

import UIKit

class SubscriptionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lblSubtotal: UILabel!
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var menus : [Menus] = []
    
    
//    var subscriptions = [1,2,1,2,2,1]
//    var menuNames = ["Menu #1",
//                    "Menu #2",
//                    "Menu #3",
//                    "Menu #4",
//                    "Menu #5",
//                    "Menu #6" ]
//    var menuPrices =   [10.49, 11.99, 10.29, 34.99, 44.55, 33.44]
//    var menuDetails = ["​Roasted lamb (~600gr) sitting on a bed of aromatic Basmati Rice with                      the option of fried onions, almonds and raisins on top.",
//                      "​Roasted whole Chicken sitting on a bed of aromatic Basmati Rice with the option of fried onions, almonds and raisins on top.",
//                      "Roasted lamb (~600gr) sitting on a bed of aromatic Basmati Rice with the option of fried onions, almonds and raisins on top.",
//                      "Sizzled diced lamb with onions, green onions and tomatoes topped with fresh cilantro.",
//                      "​Eggs cooked with freshly cut onions, green onions, and tomatoes",
//                      "Ground beef sautéed with onions, green onions, and tomatoes topped with fresh parsley."]
//    var deliveryPersons = [ "Muharrem Kaya",
//                            "Derya Kaya",
//                            "Hossain Zawad",
//                            "Danylo Perepesin",
//                            "Volodymyr Voytenko",
//                            "Simon Hood" ]
//    var deliveryAddress = ["2050 Islington Ave Eotbicoke L4V1P5",
//                           "1520 Dundas Ave Eotbicoke K4N1P7",
//                           "15 Bayview Ave Eotbicoke S4S1P2",
//                           "44 Eglington Ave Eotbicoke R4R1P9",
//                           "160 Upper Middle Ave Eotbicoke W4Q1P2",
//                           "789 Albion Ave Eotbicoke K4S1P1",
//    ]
    
    var subTotal = 0.00
    
    
    @IBAction func unwindToTableViewController(sender: UIStoryboardSegue){
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let id = (tableView.cellForRow(at: indexPath)?.tag ?? 0) as Int
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete", handler:
        {  action, index in
            
            self.menus  = self.menus.filter {$0.id != id}
            
            tableView.reloadData()
        })

        delete.backgroundColor = .red
        
        return [delete]
    }
    
  
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell (withIdentifier: "subsCell", for: indexPath) as? SubscriptionTableViewCell ??
                SubscriptionTableViewCell(style: .default, reuseIdentifier:"subsCell")
        
 
      
        
        subTotal = 0.00
        
        cell.backgroundColor = .clear
  
        let row = indexPath.row
        
        cell.subMenu = menus[row]
                             
        cell.tag = menus[row].id ?? 0

        cell.lblMenuName.text = menus[row].name
        cell.lblPrice.text = String(menus[row].price)
        cell.lblMenuDetail.text = menus[row].detail
        
        cell.lblDeliveryPerson.text = mainDelegate.customer.fullName
        cell.lblDeliveryAddress.text = "\(mainDelegate.customer.customerContacts[0].name) \(mainDelegate.customer.customerContacts[0].streetAddress1) \(mainDelegate.customer.customerContacts[0].streetAddress2) \(mainDelegate.customer.customerContacts[0].city) \(mainDelegate.customer.customerContacts[0].province)                \(mainDelegate.customer.customerContacts[0].postalCode)"
        
        cell.lblSubscriptionDays.text = " 7 days"
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = mainDelegate.subscribedMenus

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
