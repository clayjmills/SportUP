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
    
    // right place to fetch?
    func fetchPickupGameFromCloudKit(sportType: String, completion: @escaping ([PickupGame]) -> Void) {
        
        let predicate = NSPredicate(format: "sport == %@", sportType)

        //Instance method. make sure to called the shared instance of a class.
        CloudKitManager.shared.fetchRecordsWithType(PickupGame.typeKey, predicate: predicate, recordFetchedBlock: nil) { (records, error) in
            
            if let error = error {
                print("There was an error fetching pickupGames from CloudKit: \(error.localizedDescription)")
                return
            }
            
            // Use the records
            guard let records = records else { return }
            
            let pickupGames = records.flatMap( { PickupGame(cloudKitRecord: $0) } )
            
            completion(pickupGames)
        }
    }
}
