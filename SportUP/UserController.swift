//
//  UserController.swift
//  SportUP
//
//  Created by Clay Mills on 5/8/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import Foundation
import CloudKit

class UserController {
    
    static let shared = UserController()
    
    var currentUser: User?
    var newUserUsername: String?
    
    func fetchLoggedInUser(completion: @escaping(Bool) -> Void) {
        
        // send to cloudkit and get record back with all information back
        CloudKitManager.shared.fetchCurrentUser { (currentUser, appleUserRef) in
            //if user is nil run first closure, else run the second closure
            if currentUser != nil {
                self.currentUser = currentUser
                completion(true)
            } else {
                guard let appleUserRef = appleUserRef,
                    let newUserName = self.newUserUsername
                    else { completion(false); return }
                
                let user = User(username: newUserName, referenceToCKUserRecord: appleUserRef)
                let record = CKRecord(user: user)
                CloudKitManager.shared.saveRecord(record, completion: { (record, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        completion(false)
                    }
                    user.recordID = record?.recordID
                    self.currentUser = user
                    completion(true)
                })
            }
        }
    }
}
