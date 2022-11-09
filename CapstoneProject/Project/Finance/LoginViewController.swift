//
//  MenuViewController.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-04-13.
//

import UIKit
import FirebaseCore
import FirebaseAuth

// For Sign in with Google
import GoogleSignIn

// For Sign in with Facebook
import FBSDKLoginKit

// For Sign in with Apple
import AuthenticationServices
import CryptoKit

private let kFacebookAppID = "2864347037193278"

class LoginViewController: UIViewController , DataSourceProviderDelegate {
    var dataSourceProvider: DataSourceProvider<AuthProvider>!


    override func loadView() {
      view = UITableView(frame: .zero, style: .insetGrouped)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
