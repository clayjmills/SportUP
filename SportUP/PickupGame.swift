//
//  PickupGame.swift
//  SportUP
//
//  Created by Clay Mills on 4/6/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import Foundation
import MapKit
import CloudKit

class PickupGame {
    
    static let sportKey = "sport"
    static let ownerKey = "owner"
    static let ownerRefKey = "ownerRef"
    static let dateKey = "date"
    static let locationKey = "location"
    static let typeKey = "pickupGame"
    
    //sport(from picker), owner, date, location
    var sport: String
    var owner: User?
    var ownerRef: CKReference?
    var date: Date
    //CL = Core Location
    var location: CLLocation
  
    
    init(sport: String, ownerRef: CKReference?, date: Date, location: CLLocation) {
        self.sport = sport
        self.ownerRef = ownerRef
        self.date = date
        self.location = location
    }
    
    //save to CKRecord to cloudkit
    init?(cloudKitRecord: CKRecord) {
        guard let sport = cloudKitRecord[PickupGame.sportKey] as? String,
        let ownerRef = cloudKitRecord[PickupGame.ownerRefKey] as? CKReference,
        let date = cloudKitRecord[PickupGame.dateKey] as? Date,
            let location = cloudKitRecord[PickupGame.locationKey] as? CLLocation else {return nil}
    
        self.sport = sport
        self.ownerRef = ownerRef
        self.date = date
        self.location = location
    }
    // make the CKRecord (dictionary)
    var cloudKitRecord: CKRecord {
        let record = CKRecord(recordType: PickupGame.typeKey)
        // put values inside the CKRecord
        record.setValue(sport, forKey: PickupGame.sportKey)
        record.setValue(ownerRef, forKey: PickupGame.ownerRefKey)
        record.setValue(date, forKey: PickupGame.dateKey)
        record.setValue(location, forKey: PickupGame.locationKey)
        
        return record
    }
}

//func ==(lhs: PickupGame, rhs: PickupGame) -> Bool {
//    if lhs.sport != rhs.sport {return false}
//    if lhs.owner != rhs.owner {return false}
//    if lhs.date != rhs.date {return false}
//    if lhs.location != rhs.location {return false}
//    
//    return true
//}

