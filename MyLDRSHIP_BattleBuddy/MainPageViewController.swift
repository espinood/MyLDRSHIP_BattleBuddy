//
//  MainPageViewController.swift
//  MyLDRSHIP_BattleBuddy
//
//  Created by CSSE Department on 5/18/20.
//  Copyright © 2020 CSSE Department. All rights reserved.
//

import UIKit
import Firebase

class MainPageViewController : UIViewController {
    let personnelManagerSegueIdentifier = "PersonnelManagerSegue"
    var authListenerHandle : AuthStateDidChangeListenerHandle!
    var profilesCollRef : CollectionReference!
    var profileListener : ListenerRegistration!
    var profiles = [Profile]()
    
    var tasksCollRef : CollectionReference!
    var tasksListener : ListenerRegistration!
    var tasks = [Task]()
    
    @IBOutlet weak var organizationName: UILabel!
    @IBOutlet weak var welcomeUserLabel: UILabel!
    @IBOutlet weak var organizationInsignia: UIImageView!
    @IBOutlet weak var higherUpInsignia: UIImageView!
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBAction func settingsPressed(_ sender: Any) {
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
        // Configure
        alertController.addAction(UIAlertAction(title: "Log out",
                                                style: .default) { (action) in
                                                    self.logOut()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        alertController.addAction(cancelAction)
        
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func pressedLogOut(_ sender: Any) {
        logOut()
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            print("Logged out successfully")
        } catch {
            print("Sign out error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBar.leftBarButtonItem = nil
        navBar.setHidesBackButton(navBar.hidesBackButton, animated: true)
        organizationName.text = "Wabash Battalion"
        
        //        if profile!.firstname == "nil" {
        //            welcomeUserLabel.text = "Welcome\n" + Auth.auth().currentUser!.email!
        //        } else {
        //            welcomeUserLabel.text = "Welcome\n" + profile!.firstname
        //        }
        
        profilesCollRef = Firestore.firestore().collection("Profiles")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        authListenerHandle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if (Auth.auth().currentUser == nil) {
                print("There is no user. Go back to the login page")
                self.navigationController?.popViewController(animated: true)
            } else {
                print("You signed in already")
            }
        })
        
        listenToExtractData()
        
    }
    
    func listenToExtractData(){
        if (profileListener != nil) {
            profileListener.remove()
        }
        let profileQuery = profilesCollRef.whereField("UID", isEqualTo: Auth.auth().currentUser!.uid)
        profileListener = profileQuery.addSnapshotListener({ (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.profiles.removeAll()
                print("---First Document---")
                querySnapshot.documents.forEach { (documentSnapshot) in
                    print("      *****     ")
                    print(documentSnapshot.documentID)
                    print(documentSnapshot.data())
                    self.profiles.append(Profile(documentSnapshot: documentSnapshot))
                }
            } else {
                print("Error: Getting photo data \(error!)")
                return
            }
            print("---No More Profiles---")
            print()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileListener.remove()
        Auth.auth().removeStateDidChangeListener(authListenerHandle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == personnelManagerSegueIdentifier {
            (segue.destination as! PersonnelManagerViewController).profileRef = profilesCollRef.document(Auth.auth().currentUser!.email!)
            (segue.destination as! PersonnelManagerViewController).profileInfoCollRef = profilesCollRef.document(Auth.auth().currentUser!.email!).collection("Profile-Info")
            (segue.destination as! PersonnelManagerViewController).profile = profiles[0]
        }
    }
}
