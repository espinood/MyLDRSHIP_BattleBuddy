//
//  TaskManagerViewController.swift
//  MyLDRSHIP_BattleBuddy
//
//  Created by CSSE Department on 5/18/20.
//  Copyright © 2020 CSSE Department. All rights reserved.
//

import UIKit
import Firebase

class TaskDetailsViewController : UIViewController {
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var assignedByLabel: UILabel!
    @IBOutlet weak var assignedToLabel: UILabel!
    
    var task : Task?
    var taskRef : DocumentReference!
    var taskListener : ListenerRegistration!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskListener = taskRef.addSnapshotListener({ (documentSnapshot, error) in
            if let error = error {
                print("Error getting photo from bucket \(error)")
                return
            }
            if !documentSnapshot!.exists {
                print("Might go back to the list since someone else deleted this document")
                return
            } else {
                self.task = Task(documentSnapshot: documentSnapshot!)
                
//                if(Auth.auth().currentUser!.email! == self.task?.assignedBy) {
//                    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
//                                                                             target: self,
//                                                                             action: #selector(self.showEditDialog))
//
//                    self.updateView()
//                } else {
//                    self.navigationItem.rightBarButtonItem = nil
//                }
                
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        taskListener.remove()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        taskNameLabel.text = task?.taskId
        assignedByLabel.text = task?.assignedBy
        
        var assignees : NSMutableString = ""
        for assignee in task!.assignedTo {
            assignees.append("\(assignee)\n")
        }
        assignedToLabel.text = assignees as String
    }
//
//    @objc func showEditDialog() {
//        let alertController = UIAlertController(title: "Edit the task",
//                                                message: "",
//                                                preferredStyle: .alert)
//        // Configure
//        alertController.addTextField{ (textField) in
//            textField.placeholder = "Name"
//            textField.text = self.task?.taskId
//        }
//
//        let cancelAction = UIAlertAction(title: "Cancel",
//                                         style: .cancel,
//                                         handler: nil)
//        alertController.addAction(cancelAction)
//
//        alertController.addAction(UIAlertAction(title: "Submit",
//                                                style: .default) { (action) in
//                                                    let nameTextField = alertController.textFields![0] as UITextField
//
//                                                    self.taskRef.updateData([
//                                                        "name" : nameTextField.text!
//                                                    ])
//        })
//
//        present(alertController, animated: true, completion: nil)
//    }
    
//    func updateView() {
//        // UIOutlets
//        taskNameLabel.text = task?.taskId
//    }
    
}
