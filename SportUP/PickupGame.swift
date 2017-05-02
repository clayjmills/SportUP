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
    //sport(from picker), owner, time, date, location
    var sport: String 
    var owner: String
    var time: String
    var date: String
    //CL = Core Location
    var location: CLLocation
    
    init(sport: String, owner: String, time: String, date: String, location: CLLocation) {
    self.sport = sport
    self.owner = owner
    self.time = time
    self.date = date
    self.location = location
    }
   
}
