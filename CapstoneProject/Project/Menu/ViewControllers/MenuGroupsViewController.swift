//
//  MenuGroupsViewController.swift
//  HealtyMealMenu
//
// Mamona Ghaffar
// this class displays the menus and information in a tabular form

import UIKit

class MenuGroupsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //array for holding the images
    var menuImages = [UIImage(named: "menu1"),UIImage(named: "menu2"),UIImage(named: "menu3"),UIImage(named: "menu4"),UIImage(named: "menu5"), UIImage(named: "menu6") ]
//    var menuDetail = ["​Roasted lamb (~600gr) sitting on a bed of aromatic Basmati Rice with the option of fried onions, almonds and raisins on top.",
//                      "​Roasted whole Chicken sitting on a bed of aromatic Basmati Rice with the option of fried onions, almonds and raisins on top.",
//                      "Roasted lamb (~600gr) sitting on a bed of aromatic Basmati Rice with the option of fried onions, almonds and raisins on top.",
//                      "Sizzled diced lamb with onions, green onions and tomatoes topped with fresh cilantro.",
//                      "​Eggs cooked with freshly cut onions, green onions, and tomatoes",
//                      "Ground beef sautéed with onions, green onions, and tomatoes topped with fresh parsley."]
  
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // maindelegate object
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    //for holding the menu
    var menus : [Menus] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getMenusData()
    }
    
    //getting the menu information from the webservices
    func getMenusData(){
        
        let defaults = UserDefaults.standard
  
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        Webservice().getMenus(token: token) { (result) in
            switch result {
            case .success(let items):
                DispatchQueue.main.async {
                    self.menus = items
                    print("*****************************************************")
                    print("Menus Received")
                    print("*****************************************************")
                    
                    
                    self.tableView.reloadData()
                }
            case .failure(_):
                print("Couldnt Get Health Data")
            }
        }
        
        
    }
    
    //segue for unwinding back to this controller
    @IBAction func unwindToTableViewController(sender: UIStoryboardSegue){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    //displaying the custom cell for menu
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell (withIdentifier: "myCell", for: indexPath) as? MenuGroupTableViewCell ??
                                                                  MenuGroupTableViewCell(style: .default, reuseIdentifier:"myCell")
        cell.backgroundColor = .clear
                                                                                                                                   

        let row = indexPath.row
        
        cell.menu = menus[row]
        
        cell.tag = menus[row].id ?? 0
                             
        cell.lblPrice.text = "Price: \(menus[row].price)$"
        cell.lblDetail.text = menus[row].detail
        cell.lblCalorie.text = "Calorie: \(menus[row].calorie)"
        cell.imgMenu.image = menuImages[row%5]
        cell.lblMenuName.text = "Menu # \(menus[row].name)"
        
        return cell
        
    }
    //displaying the info and storing the info to maindelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let id = (tableView.cellForRow(at: indexPath)?.tag ?? 0) as Int
        
        mainDelegate.selectedMenu  = menus.filter{  $0.id == id}.first ?? Menus()
        
       performSegue(withIdentifier: "MenuToMenuDetail", sender: nil)
        
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
