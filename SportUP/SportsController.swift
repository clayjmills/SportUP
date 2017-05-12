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
        
        for sportsName in SportsListArray.sportsNames {
            
            guard let index = SportsListArray.sportsNames.index(of: sportsName) else {return []}
            
            if index > 0 {
                
                let imageNames = SportsListArray.imageName[index - 1]
                
                let sports = Sports(sportsName: sportsName, imageName: imageNames)
                
                placeHolderSports.append(sports)
            }
        }
        return placeHolderSports
    }
}
