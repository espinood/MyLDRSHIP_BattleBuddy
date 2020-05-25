//
//  Task.swift
//  MyLDRSHIP_BattleBuddy
//
//  Created by CSSE Department on 5/24/20.
//  Copyright © 2020 CSSE Department. All rights reserved.
//

import Foundation
import Firebase

class Task {
    var taskId : String
    var assignedTo : [String]
    var assignedBy : String
    var createdOn : Timestamp
    var updatedOn : Timestamp
    
    init(documentSnapshot : DocumentSnapshot){
        self.taskId = documentSnapshot.documentID
        let data = documentSnapshot.data()!
        
        self.assignedBy = data["assignedBy"] as! String
        self.assignedTo = data["assignedTo"] as! [String]
        self.createdOn = data["createdOn"] as! Timestamp
        self.updatedOn = data["updatedOn"] as! Timestamp
    }
}
