//
//  LogInViewController.swift
//  MyLDRSHIP_BattleBuddy
//
//  Created by CSSE Department on 5/18/20.
//  Copyright © 2020 CSSE Department. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import Rosefire
import GoogleSignIn

class LogInViewController : UIViewController {
    let mainPageSegueIdentifier = "MainPageSegue"

    @IBOutlet weak var logInAppImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()       
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            print("Someone is already signed in")
            self.performSegue(withIdentifier: self.mainPageSegueIdentifier, sender: self)
        }
    }
    
    @IBAction func pressedSignUp(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error creating a new user for Email/Password: \(error)")
                return
            }
        
            print("It worked an new user is created and signed in")
            print("Email: \(authResult!.user.email!)  UID: \(authResult!.user.uid)")
            self.performSegue(withIdentifier: self.mainPageSegueIdentifier, sender: self)
        }
    }
    
    @IBAction func pressedLogIn(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error logging in an existing user for Email/Password: \(error)")
                return
            }
        
            print("It worked! An user is logged in")
            print("Email: \(authResult!.user.email!)  UID: \(authResult!.user.uid)")
            self.performSegue(withIdentifier: self.mainPageSegueIdentifier, sender: self)
        }
    }
    
//    @IBAction func pressedRosefire(_ sender: Any) {
//        Rosefire.sharedDelegate().uiDelegate = self // This should be your view controller
//        Rosefire.sharedDelegate().signIn(registryToken: REGISTRY_TOKEN) { (err, result) in
//          if let err = err {
//            print("Rosefire sign in error! \(err)")
//            return
//          }
////          print("Result = \(result!.token!)")
//          print("Result = \(result!.username!)")
//          print("Result = \(result!.name!)")
//          print("Result = \(result!.email!)")
//          print("Result = \(result!.group!)")
//          Auth.auth().signIn(withCustomToken: result!.token) { (authResult, error) in
//            if let error = error {
//              print("Firebase sign in error! \(error)")
//              return
//            }
//            // User is signed in using Firebase!
//            self.performSegue(withIdentifier: self.showListSegueIdentifier, sender: self)
//          }
//        }
//    }
    
}
