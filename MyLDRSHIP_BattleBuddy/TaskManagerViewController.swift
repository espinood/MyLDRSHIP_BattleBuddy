//
//  TaskManagerViewController.swift
//  MyLDRSHIP_BattleBuddy
//
//  Created by CSSE Department on 5/18/20.
//  Copyright © 2020 CSSE Department. All rights reserved.
//

import UIKit
import Firebase

class TaskManagerViewController : UITableViewController {
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var toolbar: UIToolbar!
    
    let taskCellIdentifier = "TaskManagerCell"
    let detailSegueIdentifier = "TaskDetailSegue"
    var tasksRef : CollectionReference!
    var taskListener : ListenerRegistration!
    var authListenerHandle : AuthStateDidChangeListenerHandle!
    
    var tasks = [Task]()
    var isShowingTasksIAssigned = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.rightBarButtonItem = UIBarButtonItem(title: "Menu",
                                                            style: UIBarButtonItem.Style.plain,
                                                            target: self,
                                                            action: #selector(showMenu))
        
//        tasksRef = Firestore.firestore().collection("Tasks")
    }
    
    @objc func showMenu() {
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
        // Configure
        alertController.addAction(UIAlertAction(title: "Assign a Task",
                                                style: .default) { (action) in
                                                    self.showAddQuoteDialog()
        })
        alertController.addAction(UIAlertAction(title: self.isShowingTasksIAssigned ? "Show My Tasks" : "Show Tasks I Assigned",
                                                style: .default) { (action) in
                                                    // Toggle the show all vs show mine mode
                                                    self.isShowingTasksIAssigned = !self.isShowingTasksIAssigned
                                                    // Update the list
                                                    self.startListening()
        })
//        alertController.addAction(UIAlertAction(title: "View someone else's tasks",
//                                                style: .default) { (action) in
//                                                    // Bring up scrollable list of users to choose from
//        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        alertController.addAction(cancelAction)
        
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    //@objc
    func showAddQuoteDialog(){
        let alertController = UIAlertController(title: "Assign a task",
                                                message: "",
                                                preferredStyle: .alert)
        // Configure
        alertController.addTextField{ (textField) in
            textField.placeholder = "Task name"
        }
        
        alertController.addTextField{ (textField) in
            textField.placeholder = "Assign to"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        alertController.addAction(cancelAction)
        
        alertController.addAction(UIAlertAction(title: "Create task",
                                                style: .default) { (action) in
                                                    let taskNameTextField = alertController.textFields![0] as UITextField

                                                    let assigneeTextField = alertController.textFields![1] as UITextField
                                                    
                                                    self.tasksRef.document(taskNameTextField.text!).setData([
                                                        "assignedTo": [assigneeTextField.text!],
                                                        "assignedBy": Auth.auth().currentUser!.email!,
                                                        "createdOn": Timestamp.init(),
                                                        "updatedOn": Timestamp.init()
                                                        
                                                    ])
                                                    // After creation of the task, create subtaks where real task is
        })
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Retrieving tasks")
        startListening()
    }
    
    func startListening() {
        if taskListener != nil {
            taskListener.remove()
        }
        
        var taskQuery = tasksRef.order(by: "updatedOn", descending: false).limit(to: 50)
        
        if isShowingTasksIAssigned {
            taskQuery = tasksRef.whereField("assignedBy", isEqualTo: Auth.auth().currentUser!.email!)
        } else {
            taskQuery = tasksRef.whereField("assignedTo", arrayContains: Auth.auth().currentUser!.email!)
        }
        
        taskListener = taskQuery.addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks.removeAll()
//                if self.isShowingTasksIAssigned { print("---Printing all tasks I assigned---")
//                } else {print("---Printing all my tasks---") }
                querySnapshot.documents.forEach { (documentSnapshot) in
//                    print("      *****     ")
//                    print(documentSnapshot.documentID)
//                    print(documentSnapshot.data())
                    self.tasks.append(Task(documentSnapshot: documentSnapshot))
                }
                self.tableView.reloadData()
            } else {
//                print("Error: Getting task data \(error!)")
                return
            }
//            if self.isShowingTasksIAssigned {  print("---I assigned no more tasks---")
//            } else {print("---I have no more tasks---") }
            print()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskListener.remove()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: taskCellIdentifier, for: indexPath)
        
        // Configure the cell
        cell.textLabel?.text = tasks[indexPath.row].taskId
        cell.detailTextLabel?.text = tasks[indexPath.row].assignedBy
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let task = tasks[indexPath.row]
        let email = Auth.auth().currentUser!.email!
        return task.assignedBy == email
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let taskToDelete = tasks[indexPath.row]
            tasksRef.document(taskToDelete.taskId).delete()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailSegueIdentifier {
            if let indexPath = tableView.indexPathForSelectedRow {
                (segue.destination as! TaskDetailsViewController).taskRef = tasksRef.document(tasks[indexPath.row].taskId)
            }
        }
    }
    
    
}
