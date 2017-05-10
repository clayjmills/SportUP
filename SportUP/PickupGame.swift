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

class PickupGame: Equatable {
    
    static let sportKey = "sport"
    static let userKey = "user"
    static let dateKey = "date"
    static let locationKey = "location"
    static let typeKey = "pickupGame"
    
    //sport(from picker), owner, date, location
    var sport: String
    var user: String
    var date: Date
    //CL = Core Location
    var location: CLLocation
  
    
    init(sport: String, user: String, date: Date, location: CLLocation) {
        self.sport = sport
        self.user = user
        self.date = date
        self.location = location
    }
    
    //save to CKRecord to cloudkit
    init?(cloudKitRecord: CKRecord) {
        guard let sport = cloudKitRecord[PickupGame.sportKey] as? String,
        let user = cloudKitRecord[PickupGame.userKey] as? String,
        let date = cloudKitRecord[PickupGame.dateKey] as? Date,
            let location = cloudKitRecord[PickupGame.locationKey] as? CLLocation else {return nil}
    
        self.sport = sport
        self.user = user
        self.date = date
        self.location = location
    }
    // make the CKRecord (dictionary)
    var cloudKitRecord: CKRecord {
        let record = CKRecord(recordType: PickupGame.typeKey)
        // put values inside the CKRecord
        record.setValue(sport, forKey: PickupGame.sportKey)
        record.setValue(user, forKey: PickupGame.userKey)
        record.setValue(date, forKey: PickupGame.dateKey)
        record.setValue(location, forKey: PickupGame.locationKey)
        
        return record
    }
}

func ==(lhs: PickupGame, rhs: PickupGame) -> Bool {
    if lhs.sport != rhs.sport {return false}
    if lhs.user != rhs.user {return false}
    if lhs.date != rhs.date {return false}
    if lhs.location != rhs.location {return false}
    
    return true
}

