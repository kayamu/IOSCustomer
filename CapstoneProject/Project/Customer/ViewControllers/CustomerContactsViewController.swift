
//  CustomerAddressViewController.swift
//  CapstoneProject
//
// Derya Kaya
// this class holds the customer address info fields and table to display the addresses
// the addresses are displayed as a customized cell
// this class also establishes webservice connection to add data to the webservices
//after proper authentication has been performed using FirebaseAuth framework

import UIKit
import FirebaseAuth

class CustomerContactsViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
  

    @IBOutlet weak var txtName          : UITextField!
    @IBOutlet weak var txtLine1         : UITextField!
    @IBOutlet weak var txtCity          : UITextField!
    @IBOutlet weak var txtLine2         : UITextField!
    @IBOutlet weak var txtPostCode      : UITextField!
    @IBOutlet weak var txtProvince      : UITextField!
    @IBOutlet weak var swActive         : UISwitch!
    @IBOutlet weak var tableView        : UITableView!
    
    enum tableStates{
        case edit
        case add
        case delete
    }
    
    var currentContact : CustomerContact = CustomerContact()
    
    var tableState : tableStates = .add
    
    
    @IBAction func unwindToTableViewController(sender: UIStoryboardSegue){
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let id = (tableView.cellForRow(at: indexPath)?.tag ?? 0) as Int
        let contact = self.mainDelegate.customer.customerContacts[id]
        let customer = mainDelegate.customer
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete", handler:
        {  action, index in
            //self.setTableWithNewValues(state:.delete, id: contact.id ?? 0)
            if let i = customer.customerContacts.firstIndex(of: contact) {
                customer.customerContacts.remove(at: i)
            }
            
            customer.customerContacts = customer.customerContacts.filter { $0.name != "" }
            
            
            tableView.reloadData()

            self.currentContact = CustomerContact()
            self.clearFormFields()
        })

        let edit = UITableViewRowAction(style: .normal, title: "Edit", handler:
        {  action, index in
            self.setFormFields(contact: contact)
            self.currentContact = contact
            self.tableState = .edit
        })
        
        delete.backgroundColor = .red
        edit.backgroundColor = .blue
        
        return [delete, edit]
    }
    
    
    @IBAction func btnNextAction(_ sender: Any) {
        
        addDataToWebService()
        
        self.performSegue(withIdentifier: "ContactToHealth", sender: nil)
        
    }
    
    
    func addDataToWebService(){
        
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        let httpType : httpMethods = .put

        
        //let val = try? JSONEncoder().encode(mainDelegate.customer)
        
        print(String(describing: mainDelegate.customer))
        
        
        Webservice().customerById (token: token, customer: mainDelegate.customer, id: mainDelegate.customer.id ?? 0, httpType: httpType){
            (result) in
                switch result {
                case .success(let customer):
                    print(customer)
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
       
        
        
    }
    
    
    func setFormFields(contact : CustomerContact){
        currentContact = contact
        txtName    .text = contact.name
        txtLine1   .text = contact.streetAddress1
        txtCity    .text = contact.city
        txtLine2   .text = contact.streetAddress2
        txtPostCode.text = contact.postalCode
        txtProvince.text = contact.province
        swActive   .isOn = contact.active
    }
    
    func clearFormFields(){
        txtName    .text = ""
        txtLine1   .text = ""
        txtCity    .text = ""
        txtLine2   .text = ""
        txtPostCode.text = ""
        txtProvince.text = ""
        swActive   .isOn = true
        
        tableView.reloadData()
    }
    
    @IBAction func btnPostAction(_ sender: Any) {
        
        if tableState == .edit
        {
            setTableWithNewValues(state: .edit, item: currentContact)
            tableState = .add
            clearFormFields()
        }
        else
        {
            setTableWithNewValues(state: .add, item: CustomerContact())
            tableState = .add
            clearFormFields()
        }
    }
    
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mainDelegate.customer.customerContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell (withIdentifier:
            "cellCustomerContact", for: indexPath) as? CustomerContactsTableViewCell ??
                                          CustomerContactsTableViewCell(style: .default,
                                                                        reuseIdentifier:"cellCustomerContact")
        cell.backgroundColor = .clear
           
        let row = indexPath.row

        let item = mainDelegate.customer.customerContacts[row]
        
        cell.lblContactName.text = item.name
        cell.lblFullAddress.text = ("\(item.streetAddress1) \(item.streetAddress2) \(item.city) \(item.postalCode) \(item.province)")
        cell.swActive.isOn = item.active
        
        cell.tag = row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let id = (tableView.cellForRow(at: indexPath)?.tag ?? 0) as Int
        let contact = mainDelegate.customer.customerContacts[id]
        currentContact = contact
        setFormFields(contact: contact)
        tableState = .edit
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    func setTableWithNewValues(state: tableStates, item: CustomerContact) {
        

        
        let id              = item.id ?? 0
        let name            = txtName.text      ?? ""
        let streetAddress1  = txtLine1.text     ?? ""
        let streetAddress2  = txtLine2.text     ?? ""
        let city            = txtCity.text      ?? ""
        let postalCode      = txtPostCode.text  ?? ""
        let province        = txtProvince.text  ?? ""
        let detail          = ""
        let active          = swActive.isOn
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        let createdDate = dateFormatter.string(from: Date.now)
        
        var customerContact = CustomerContact(
                id              :id           ,
                name            :name          ,
                streetAddress1  :streetAddress1,
                streetAddress2  :streetAddress2,
                city            :city          ,
                postalCode      :postalCode    ,
                province        :province      ,
                detail          :detail        ,
                active          :active        ,
                createdDate     :createdDate
        )
        
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }

        var httpType : httpMethods = .put

        switch state {
        case .edit:
            httpType = .put
        case .add:
            httpType = .post
        case .delete:
            httpType = .delete

        }

        Webservice().customerContactById (token: token, item: customerContact, id: customerContact.id ?? 0, httpType: httpType){
            (result) in
                switch result {
                case .success(let cContact):
                    DispatchQueue.main.async {
                        let customer = self.mainDelegate.customer

                        if let i = customer.customerContacts.firstIndex(of: item)
                            {customer.customerContacts[i] = cContact}
                          else
                            {customer.customerContacts.append(cContact)}
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                      print(error.localizedDescription)
                }
           }
    }
}

