//
//  PersonnelManagerViewController.swift
//  MyLDRSHIP_BattleBuddy
//
//  Created by CSSE Department on 5/18/20.
//  Copyright © 2020 CSSE Department. All rights reserved.
//

import UIKit
import Firebase

class PersonnelManagerViewController : UIViewController {
    let profileSegueIdentifier = "ProfileSegue"
    let taskManagerSegueIdentifier = "TaskManagerSegue"
    //    let myCoCSegueIdentifier = "MyCoCSegue"
    //    let fullCoCSegueIdentifier = "FullCoCSegue"
    
    var profile : Profile?
    var profileRef : DocumentReference!
    var profileListener : ListenerRegistration!
    var profileInfoCollRef : CollectionReference!
    
    var tasksListener : ListenerRegistration!
    var tasksCollRef : CollectionReference!
    var tasks = [Task]()
    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var toolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksCollRef = Firestore.firestore().collection("Tasks")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (profileListener != nil) {
            profileListener.remove()
        }

        profileListener = profileInfoCollRef!.addSnapshotListener({ (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                print("---First Document---")
                querySnapshot.documents.forEach { (documentSnapshot) in
                    print("      *****     ")
                    print(documentSnapshot.documentID)
                    print(documentSnapshot.data())
                    self.profile!.addInfo(documentSnapshot: documentSnapshot)
                }
            } else {
                print("Error: Getting photo data \(error!)")
                return
            }
            print("---No More Documents---")
            print()
        })
        
        if (tasksListener != nil) {
            tasksListener.remove()
        }
        
        let taskQuery = tasksCollRef.order(by: "updatedOn", descending: false).limit(to: 50)
        tasksListener = taskQuery.addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks.removeAll()
//                print("---Printing all tasks---")
                querySnapshot.documents.forEach { (documentSnapshot) in
//                    print("      *****     ")
//                    print(documentSnapshot.documentID)
//                    print(documentSnapshot.data())
                    self.tasks.append(Task(documentSnapshot: documentSnapshot))
                }
            } else {
//                print("Error: Getting task data \(error!)")
                return
            }
//            print("---No more tasks---")
//            print()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileListener.remove()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == profileSegueIdentifier {
            (segue.destination as! ProfileViewController).profileRef = profileRef
            (segue.destination as! ProfileViewController).profile = profile
            
            (segue.destination as! ProfileViewController).profileInfoRef = profileInfoCollRef
        }
        
        if segue.identifier == taskManagerSegueIdentifier {
            (segue.destination as! TaskManagerViewController).tasksRef = tasksCollRef
        }
    }
    
}


