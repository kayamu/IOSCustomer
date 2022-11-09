//
//  ViewController.swift
//  HealtyMealCustomer
//
//  Derya Kaya
// this class holds the customer contact and general info fields
//grabs the info after successfully connecting with the webservices

import UIKit
import FirebaseAuth

class CustomerViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtDetail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmailAddress: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPassAgain: UITextField!
    
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtUserID: UITextField!
    
    @IBAction func btnCustomerToaddress(_ sender: Any) {
        setCustomers()
        performSegue(withIdentifier: "CustomerToAddress", sender: nil)
    }
    
    @IBOutlet weak var swGender: UISegmentedControl!
    @IBOutlet weak var dtBirthDate: UIDatePicker!
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var id : Int = 0
    
    // @Published var customers = Customer.initW()
    
    
    @IBAction func unwindToTableViewController(sender: UIStoryboardSegue){
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }

    func addDoneButtonOnNumpad(textField: UITextField) {
            
            let keypadToolbar: UIToolbar = UIToolbar()
            
            keypadToolbar.items=[
                UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: textField, action: #selector(UITextField.resignFirstResponder)),
                UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
            ]
            keypadToolbar.sizeToFit()
            textField.inputAccessoryView = keypadToolbar
        
           
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addDoneButtonOnNumpad(textField: txtPhone)
        
        getCustomers()
        
        
        print("*****************Address**********************")
        for contact in mainDelegate.customer.customerContacts{
            print(contact.name)
        }
        print("************************************************")
        
        print()

//        print("*****************Health Info**********************")
//        for item in mainDelegate.customer.customerHealths{
//            print(item.name)
//        }
//        print("************************************************")
//
        
    }

    @IBAction func setCustomers() {
        

        
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        
        
        Auth.auth().currentUser?.reload()
        
        
        let id          = mainDelegate.customer.id ?? 0
        let userName    = Auth.auth().currentUser?.uid ?? ""
        //let userName    = txtUserID.text ?? ""
        let fullName    = txtFullName.text ?? ""
        let password    = txtPassword.text ?? ""
        let email       = txtEmailAddress.text ?? ""
        let phone       = txtPhone.text ?? ""
        let detail     = txtDetail.text ?? ""

        
        var gender = true
        if swGender.selectedSegmentIndex == 0
            {gender      = false}
        else
            {gender      = true}
            
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        let birthday    = dateFormatter.string(from: dtBirthDate.date)
        let createdDate = dateFormatter.string(from: Date.now)
        
        let customer = Customer()
        
        
        if txtPassword.text == txtPassAgain.text{
            Auth.auth().currentUser?.updatePassword(to: txtPassword.text ?? "")
        }
        else
        {
            let errorAlertController = UIAlertController(
            title: "Error",
            message: "Password does not match",
            preferredStyle: .alert)
            
            errorAlertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(errorAlertController, animated: true, completion: nil)
        }

        Webservice().customerById(token: token, customer: customer, id: mainDelegate.customer.id ?? 0, httpType: .patch){
            (result) in
                switch result {
                case .success(let customer):
                      print("Success")
                case .failure(let error):
                      print(error.localizedDescription)
                }
      
        }
        
        self.performSegue(withIdentifier: "CustomerToAddress", sender: nil)
    }
    
    
    
    func getCustomers() {

        
        self.txtUserID.text         = mainDelegate.customer.userID
        //self.txtUserID.text       = mainDelegate.customer.
        self.txtFullName.text       = mainDelegate.customer.fullName
        self.txtEmailAddress.text   = mainDelegate.customer.email
        self.txtPhone.text          = mainDelegate.customer.phone
        self.txtDetail.text         = mainDelegate.customer.detail

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:00"

        let cBirthday = dateFormatter.date(from: mainDelegate.customer.birthday)
        self.dtBirthDate.date       = cBirthday ?? Date.now
        if mainDelegate.customer.gender{
            self.swGender.selectedSegmentIndex = 0}
        else{
            self.swGender.selectedSegmentIndex = 1}
        
    }
}


