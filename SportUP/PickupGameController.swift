//
//  PickupGameController.swift
//  SportUP
//
//  Created by Clay Mills on 4/10/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import Foundation

class PickupGameController {
    static let shared = PickupGameController()
    
    var sportsList: [Sports] = []
    
    init() {
        self.sportsList = createAllSports()
    }
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
    
    func createPickupGame() {
        
    }

}
