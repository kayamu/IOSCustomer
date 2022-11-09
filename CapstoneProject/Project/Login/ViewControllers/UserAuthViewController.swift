//
//  UserAuthViewController.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-04-13.
//
//this is the User Authentication View controller which takes in username and password
//by clicking the button the user logs in to the app
import UIKit
import FirebaseAuth

class UserAuthViewController: UIViewController, UITextFieldDelegate {
    // login outlets on the storyboard for UIObject
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    //eventahndler method
    @IBAction func btnCreateAccountAction(_ sender: Any) {
        let email = txtUserName.text ?? ""
        let pass = txtPassword.text ?? ""
        
        try? Auth.auth().signOut()
        
        Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
            guard error == nil else { return self.displayError(error) }}
        
        createWebToken(redir: "UserLoginToCustomer")
        
    }

    @Published var isAuthenticated: Bool = false
    
    @IBAction func login() {
        
        let email = txtUserName.text ?? ""
        let pass = txtPassword.text ?? ""
        try? Auth.auth().signOut()

        Auth.auth().signIn(withEmail: email, password: pass) { result, error in
          guard error == nil else {
              return self.displayError(error)
          }
         // self.delegate?.loginDidOccur()
        }
        createWebToken(redir: "UserLoginToMenu")
        //createWebToken(redir: "UserLoginToCustomer")
    }
        
        
//connecting with the webservice
    func createWebToken(redir: String){
        
        let defaults = UserDefaults.standard

        Webservice().login() { result in
            switch result {
                case .success(let token):
                    defaults.setValue(token, forKey: "jsonwebtoken")
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                        self.performSegue(withIdentifier: redir, sender: nil)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
        
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public func displayError(_ error: Error?, from function: StaticString = #function) {
      guard let error = error else { return }
      print("ⓧ Error in \(function): \(error.localizedDescription)")
      let message = "\(error.localizedDescription)\n\n Ocurred in \(function)"
      let errorAlertController = UIAlertController(
        title: "Error",
        message: message,
        preferredStyle: .alert
      )
      errorAlertController.addAction(UIAlertAction(title: "OK", style: .default))
      present(errorAlertController, animated: true, completion: nil)
    }
    

}

