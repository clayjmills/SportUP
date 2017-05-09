//
//  PickupGame.swift
//  SportUP
//
//  Created by Clay Mills on 4/6/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import Foundation
import MapKit

class PickupGame {
    //sport(from picker), owner, date, location
    var sport: String 
    var owner: String
    var date: Date
    //CL = Core Location
    var location: CLLocation
    
    init(sport: String, owner: String, date: Date, location: CLLocation) {
    self.sport = sport
    self.owner = owner
    self.date = date
    self.location = location
    }
 
    //Sample from Daves code
//    var cloudKitRecord: CKRecord {
//        let record = CKRecord(recordType: "Spot")
//        let imageAssets = temporaryPhotoURLs.flatMap({CKAsset(fileURL: $0)})
//        
//        record.setValue(name, forKey: nameKey)
//        record.setValue(location, forKey: locationKey)
//        record.setValue(created, forKey: createdKey)
//        record.setValue(keywords, forKey: keywordsKey)
//        record.setValue(description, forKey: descriptionKey)
//        record.setValue(imageAssets, forKey: imagesKey)
//        record.setValue(latitude, forKey: latitudeKey)
//        record.setValue(longitude, forKey: longitudeKey)
//        
//        return record
//    }
    
}
