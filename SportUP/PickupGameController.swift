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
    static let shared = PickupGameController()
    
    static let privateDataBase = CKContainer.default().privateCloudDatabase
    static let publicDatabase = CKContainer.default().publicCloudDatabase
    
    let cloudkitManager = CloudKitManager()
    
    
    func createAllSports() -> [Sports] {
        
        var placeHolderSports: [Sports] = []
        
        for sportsNames in SportsListArray.sportsNames {
            
            guard let index = SportsListArray.sportsNames.index(of: sportsNames) else {return []}
            
            let imageNames = SportsListArray.imageName[index]
            
            let sports = Sports(sportsName: sportsNames, imageName: imageNames)
            
            placeHolderSports.append(sports)
        }
        return placeHolderSports
    }
    
    func create(pickupGame: PickupGame) {
        
//        let ckRecord = pickupGame.
//       
//        // Save pickUpGame to CloudKit
//        cloudkitManager.publicDatabase.save(<#T##record: CKRecord##CKRecord#>, completionHandler: <#T##(CKRecord?, Error?) -> Void#>) 
        
    }

}
