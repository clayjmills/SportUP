//
//  SportsController.swift
//  SportUP
//
//  Created by Clay Mills on 4/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import Foundation

class SportsController {
    
    static let shared = SportsController()
    
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
}
