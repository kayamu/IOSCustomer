//
//  LoginViewController.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-04-13.
//
// this view controller is the log in page where user logs in and chooses the preferred SSO
// imported the necessary frameworks for login
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

//unique key ID for FB login
private let kFacebookAppID = "2864347037193278"
//object of mainDelegate
let mainDelegate = UIApplication.shared.delegate as! AppDelegate

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //calls the getToken method
        getToken()
    }
    
    // connects to the webservice for authentication
    func getToken(){
        let defaults = UserDefaults.standard
        Webservice().login() { result in
            switch result {
                case .success(let token):
                    defaults.setValue(token, forKey: "jsonwebtoken")
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    
    @Published var isAuthenticated: Bool = false
    
    // Event handler methods for the log in buttons and calling the necessary methods
    @IBAction func AppleButtonAction(_ sender: Any) {
        performAppleSignInFlow()
    }
    @IBAction func GoogleButtonAction(_ sender: Any) {
        performGoogleSignInFlow()
    }
    @IBAction func FacebookButtonAction(_ sender: Any) {
        performFacebookSignInFlow()
    }
    @IBAction func TwitterButtonAction(_ sender: Any) {
        guard let provider = AuthProvider(rawValue: "Twitter") else {
          // The row tapped has no affiliated action.
          return
        }
        
        performOAuthLoginFlow(for: provider )
    }
//performs a segues to another controller for authentication
    @IBAction func UserNameButtonAction(_ sender: Any) {
       performSegue(withIdentifier: "LoginToUserAuth", sender: nil)
    }
    
    private func performGoogleSignInFlow() {
      guard let clientID = FirebaseApp.app()?.options.clientID else { return }

      // Create Google Sign In configuration object.
      let config = GIDConfiguration(clientID: clientID)

      // Start the sign in flow!
      GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

        guard error == nil else { return displayError(error) }

        guard
          let authentication = user?.authentication,
          let idToken = authentication.idToken
        else {
          let error = NSError(
            domain: "GIDSignInError",
            code: -1,
            userInfo: [
              NSLocalizedDescriptionKey: "Unexpected sign in result: required authentication data is missing.",
            ]
          )
          return displayError(error)
        }

        let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                       accessToken: authentication.accessToken)

        Auth.auth().signIn(with: credential) { result, error in
          guard error == nil else { return self.displayError(error) }

            // At this point, our user is signed in
           self.redirectPage()
            
        }
      }
    }
    
    var currentNonce: String?

    private func performAppleSignInFlow() {
      let nonce = randomNonceString()
      currentNonce = nonce
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
      request.nonce = sha256(nonce)

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.presentationContextProvider = self
      authorizationController.performRequests()
    }
    
    private func performFacebookSignInFlow() {
      // The following config can also be stored in the project's .plist
      Settings.shared.appID = kFacebookAppID
      Settings.shared.displayName = "Healty Meal Service"
     

      // Create a Facebook `LoginManager` instance
      let loginManager = LoginManager()
      loginManager.logIn(permissions: ["email"], from: self) { result, error in
        guard error == nil else { return self.displayError(error) }
        guard let accessToken = AccessToken.current else { return }
        let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
        self.signin(with: credential)
      }
    }
    
    private var oauthProvider: OAuthProvider!

    private func performOAuthLoginFlow(for provider: AuthProvider) {
      oauthProvider = OAuthProvider(providerID: provider.id)
      oauthProvider.getCredentialWith(nil) { credential, error in
        guard error == nil else { return self.displayError(error) }
        guard let credential = credential else { return }
        self.signin(with: credential)
      }
    }
    
    public func redirectPage(){
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let defaults = UserDefaults.standard
  
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        Auth.auth().currentUser?.reload()
        
        let uid = Auth.auth().currentUser?.uid ?? ""
        
        print("User Id: \(uid)")
        
        Webservice().getCustomerByUID(token: token, uid:uid ) { (result) in
            switch result {
            case .success(let customer):
                DispatchQueue.main.async {
                    mainDelegate.customer = customer
                    print("*****************************************************")
                    print(customer.id)
                    print("*****************************************************")
                    //self.performSegue(withIdentifier: "LoginToMenu", sender: nil)
                    self.performSegue(withIdentifier: "LoginToCustomer", sender: nil)
                }
            case .failure(_):
                DispatchQueue.main.async {
                    mainDelegate.customer = Customer()
                    self.performSegue(withIdentifier: "LoginToCustomer", sender: nil)
                }
            }
        }
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
    
    private func signin(with credential: AuthCredential) {
      Auth.auth().signIn(with: credential) { result, error in
        guard error == nil else { return self.displayError(error) }
          self.redirectPage()
      }
    }
    
}
    
    
    // Implementing Sign in with Apple with Firebase

    extension LoginViewController: ASAuthorizationControllerDelegate,
      ASAuthorizationControllerPresentationContextProviding {
      //ASAuthorizationControllerDelegate

      func authorizationController(controller: ASAuthorizationController,
                                   didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential
        else {
          print("Unable to retrieve AppleIDCredential")
          return
        }

        guard let nonce = currentNonce else {
          fatalError("Invalid state: A login callback was received, but no login request was sent.")
        }
        guard let appleIDToken = appleIDCredential.identityToken else {
          print("Unable to fetch identity token")
          return
        }
        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
          print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
          return
        }

        let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                  idToken: idTokenString,
                                                  rawNonce: nonce)

        Auth.auth().signIn(with: credential) { result, error in
          // Error. If error.code == .MissingOrInvalidNonce, make sure
          // you're sending the SHA256-hashed nonce as a hex string with
          // your request to Apple.
          guard error == nil else { return self.displayError(error) }

          // At this point, our user is signed in
          // so we advance to the User View Controller
            
           
            self.performSegue(withIdentifier: "LoginToCustomer", sender: nil)
        }
      }

      func authorizationController(controller: ASAuthorizationController,
                                   didCompleteWithError error: Error) {
        // Ensure that you have:
        //  - enabled `Sign in with Apple` on the Firebase console
        //  - added the `Sign in with Apple` capability for this project
        print("Sign in with Apple errored: \(error)")
      }

      // MARK: ASAuthorizationControllerPresentationContextProviding

      func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
      }

      // MARK: Aditional `Sign in with Apple` Helpers

      // Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
      private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
          Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length

        while remainingLength > 0 {
          let randoms: [UInt8] = (0 ..< 16).map { _ in
            var random: UInt8 = 0
            let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
            if errorCode != errSecSuccess {
              fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
              )
            }
            return random
          }

          randoms.forEach { random in
            if remainingLength == 0 {
              return
            }

            if random < charset.count {
              result.append(charset[Int(random)])
              remainingLength -= 1
            }
          }
        }

        return result
      }

      private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
          String(format: "%02x", $0)
        }.joined()

        return hashString
      }
    
    }






