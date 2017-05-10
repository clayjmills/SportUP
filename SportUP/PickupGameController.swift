//
//  PickupGameController.swift
//  SportUP
//
//  Created by Clay Mills on 4/10/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import Foundation
import CloudKit

class PickupGameController {
    
    static let pickupGameKey = "pickupGame"
    static let shared = PickupGameController()
    
    static let privateDataBase = CKContainer.default().privateCloudDatabase
    static let publicDatabase = CKContainer.default().publicCloudDatabase
    
    let cloudkitManager = CloudKitManager()
    
//    init() {
//        loadFromPersistentStorage()
//    }
    
    func create(pickupGame: PickupGame) {
        
//        saveToPersistentStorage()
    }
    
//    private func loadFromPersistentStorage() {
//        
//    }
    
//    private func saveToPersistentStorage() {
//        
//        let pickupGameRecords = self.pickupGame.map({$0.cloudKitRecord})
//        
//        cloudkitManager.saveRecord(records: pickupGameRecords, perRecordcompletion: nil) { (records, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            } else {
//                print("Saved to CloudKit")
//            }
//        }
//    }
//    var pickupGame = [PickupGame]() {
//        
//    }
}
