//
//  CustomerHealthViewController.swift
//  HealtyMealCustomer
//
//  Derya Kaya
// this class is mapped to the customer health info storyboard
// collects info from the user through the ui objects
//establish connection with the webservices
//perform calculations for the target calorie and display the results on proper fields

import UIKit

class CustomerHealthViewController: UIViewController {
//outlet for the ui objects
    @IBOutlet weak var swGoal:          UISegmentedControl!
    @IBOutlet weak var swBodyFat:       UISegmentedControl!
    @IBOutlet weak var slActivityLevel: UISlider!
    @IBOutlet weak var swUnit:          UISegmentedControl!
    @IBOutlet weak var txtTargetWeight: UITextField!
    @IBOutlet weak var txtWeight:       UITextField!
    @IBOutlet weak var txtHeight:       UITextField!
    @IBOutlet weak var txtCalorie:      UITextField!
    
    @IBOutlet weak var lblHeightUnit: UILabel!
    @IBOutlet weak var lblTargetWeightUnit: UILabel!
    @IBOutlet weak var lblCurrentWeightUnit: UILabel!
    
    //main delegate object
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var customerHealth : CustomerHealths = CustomerHealths()
    
    @IBAction func unwindToTableViewController(sender: UIStoryboardSegue){
        
    }
    
    
    @IBAction func btnNextAction(_ sender: Any) {
        
            self.setHealthData()


        
    }
    
    func setHealthData(){
        let id              = customerHealth.id
        let name            = mainDelegate.customer.userID
        let currentWeight   = Double(txtWeight.text ?? "") ?? 0
        let currentHeigth   = Double(txtHeight.text  ?? "") ?? 0
        let mesuareUnit     = swUnit.selectedSegmentIndex
        let activityLevel   = Double(slActivityLevel.value)
        let targetWeight    = Double(txtTargetWeight.text ?? "") ?? 0
        let targetCalorie   = Double(txtCalorie.text ?? "") ?? 0
        
        var targetBodyFat : String = "Low"
        switch swBodyFat.selectedSegmentIndex{
        case 0: targetBodyFat = "Low"
        case 1: targetBodyFat = "Medium"
        default: targetBodyFat = "Height"
        }

        var goal : String = "LoseFat"
        switch swGoal.selectedSegmentIndex{
        case 0: goal = "LoseFat"
        case 1: goal = "Maintain"
        default: goal = "Build Muscle"
        }

        let active          = true
        let detail          = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        let createdDate = dateFormatter.string(from: Date.now)
        
        let customerHealth1 = CustomerHealths(
                    id            : id!,
                    name          : name,
                    currentWeight : currentWeight,
                    currentHeigth : currentHeigth,
                    mesuareUnit   : mesuareUnit,
                    activityLevel : activityLevel,
                    targetWeight  : targetWeight,
                    targetCalorie : targetCalorie,
                    targetBodyFat : targetBodyFat,
                    goal          : goal,
                    active        : active,
                    detail        : detail,
                    createdDate   : createdDate)
                    
        
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }

        var httpType : httpMethods = .patch
        
        if customerHealth1.id ?? 0 == 0 {httpType = .post}
        
        
        Webservice().customerHealthsById (token: token, item: customerHealth1, id: customerHealth1.id ?? 0, httpType: httpType){
            (result) in
                switch result {
                case .success(let cHealth):
                    DispatchQueue.main.async {
                        let customer = self.mainDelegate.customer

                        if let i = customer.customerHealths.firstIndex(of: self.customerHealth)
                            {customer.customerHealths[i] = cHealth
                            print("Customer health changed to array number \(cHealth.id)" )
                        }
                          else
                            {customer.customerHealths.append(cHealth)
                              print("Customer health added to array number \(cHealth.id)" )
                          }


                        let httpType : httpMethods = .put

                        Webservice().customerById (token: token, customer: self.mainDelegate.customer, id: self.mainDelegate.customer.id ?? 0, httpType: httpType){
                            (result) in
                                switch result {
                                case .success(let customer):
                                    print(customer)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
                        }
                        self.performSegue(withIdentifier: "HealthToAllergen", sender: nil)
                    }
                case .failure(let error):
                      print(error.localizedDescription)
                }
           }
    }
    
    
    func addDataToWebService(){
        
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        let httpType : httpMethods = .put
        
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if mainDelegate.customer.customerHealths.count > 0
        {customerHealth = mainDelegate.customer.customerHealths[0]}
        
        getCustomerHealthsInfo()
    }
    

    @IBAction func btnCalculate(_ sender: Any) {
        
        txtCalorie.text = calculateCalorie()
    }
    
    
    @IBAction func heightChange(_ sender: Any) {
        
        txtCalorie.text = calculateCalorie()
    }
    
    
    @IBAction func weightChange(_ sender: Any) {
        
        txtCalorie.text = calculateCalorie()
    }
    
    
    @IBAction func unitChange(_ sender: Any) {
        
        txtHeight.text = ""
        txtWeight.text = ""
        txtCalorie.text = ""
        txtTargetWeight.text = ""
        
        
        lblHeightUnit.text = "Inches"
        lblTargetWeightUnit.text = "lb"
        lblCurrentWeightUnit.text = "lb"
        
        if swUnit.selectedSegmentIndex == 0 {
            lblHeightUnit.text = "cm"
            lblTargetWeightUnit.text = "kg"
            lblCurrentWeightUnit.text = "kg"
        }
    }
    
    
    func calculateCalorie() -> String{
        
        let height = Double(txtHeight.text ?? "") ?? 1.00
        let weight = Double(txtWeight.text ?? "") ?? 1.00
        
        let now = Date()
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let birthday: Date = dateFormatter.date(from: mainDelegate.customer.birthday) ?? Date.now
        let calendar = Calendar.current
        
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year!
        
        // BMR (metric) = (10 × weight in kg) + (6.25 × height in cm) - (5 × age in years) - 161
        // BMR (imperial) = (4.536 × weight in pounds) + (15.88 × height in inches) - (5 × age) - 161
         
        var calorie : Int = 0

                
        
        if swUnit.selectedSegmentIndex == 0
        {
            let context: NSMutableDictionary = ["weight": weight, "height": height, "age" : age]
            let expr = NSExpression(format:"(10 * $weight)+(6.25 * $height)-(5 * $age)-161")
            
            calorie = expr.expressionValue(with: nil, context: context) as? Int ?? 0
        }
        else
        {
            let context: NSMutableDictionary = ["weight": weight, "height": height, "age" : age]
            let expression = NSExpression(format:"(4.536 * $weight)+(15.88 * $height)-(5 * $age)-161")

            calorie = expression.expressionValue(with: nil, context: context) as? Int ?? 0
        }
        
        return String(calorie)
        
    }
    
    

    func getCustomerHealthsInfo() {
        
        

        if (customerHealth.goal == "LoseFat"){
            self.swGoal.selectedSegmentIndex     = 0
        }
        else if (customerHealth.goal == "Maintain"){
            self.swGoal.selectedSegmentIndex     = 0
        }
        else {
            self.swGoal.selectedSegmentIndex     = 0
        }

        if (customerHealth.targetBodyFat == "Low")
        {
            self.swBodyFat.selectedSegmentIndex  = 0
        }
        else if (customerHealth.targetBodyFat == "Medium")
        {
            self.swBodyFat.selectedSegmentIndex  = 1
        }
        else
        {
            self.swBodyFat.selectedSegmentIndex  = 2
        }

        
        self.swUnit.selectedSegmentIndex = 1
        if (customerHealth.mesuareUnit == 0)
        {
            self.swUnit.selectedSegmentIndex = 0
        }
        
        self.slActivityLevel.value           = Float(customerHealth.activityLevel ?? 0)
        self.txtTargetWeight.text            = "\(customerHealth.targetWeight ?? 0)"
        self.txtWeight.text                  = "\(customerHealth.currentWeight ?? 0)"
        self.txtHeight.text                  = "\(customerHealth.currentHeigth ?? 0)"
        self.txtCalorie.text                 = "\(customerHealth.targetCalorie ?? 0)"

        
    }
    
}
    
    
    


