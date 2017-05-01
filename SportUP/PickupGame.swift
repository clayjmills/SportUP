//
//  PickupGame.swift
//  SportUP
//
//  Created by Clay Mills on 4/6/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import Foundation

class PickupGame {
    //sport(from picker), owner, time, date, location
    var sport: String 
    var owner: String
    var time: String
    var date: String
   // var location =
    
    init(sport: String, owner: String, time: String, date: String) {
    self.sport = sport
    self.owner = owner
    self.time = time
    self.date = date
    }
   
}
