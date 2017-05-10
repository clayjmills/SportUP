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
    
//    init() {
//        loadFromPersistentStorage()
//    }
    
//    private func loadFromPersistentStorage() {
//
//    }
    
    func create(pickupGame: PickupGame) {
        
    }
    
    
    func savePickUpGameToCloudKit(pickUpGame: PickupGame, completion: @escaping(_ success: Bool) -> Void) {
        
        let record = pickUpGame.cloudKitRecord
        
        CloudKitManager.shared.saveRecord(record) { (record, error) in
            
            if let error = error {
                print("There was an error saving the record to CloudKit: \(error.localizedDescription)")
                completion(false)
                return
            } else {
                completion(true)
                print("Saved to CloudKit")
            }
        }
    }
}
