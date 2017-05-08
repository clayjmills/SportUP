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
    
    func createPickupGame(sport: String, date: Date, location: CLLocation) {
        
        // Save pickUpGame to CloudKit
        
    }

}
