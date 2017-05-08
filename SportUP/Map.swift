//
//  Map.swift
//  SportUP
//
//  Created by Clay Mills on 4/10/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import Foundation
import CoreLocation

struct Map {
    var location: CLLocationCoordinate2D
    var dropPinLocation: CLLocation
    var title: String?
    var subtitle: String?
    
    init(location: CLLocationCoordinate2D, dropPinLocation: CLLocation, title: String? = nil, subtitle: String? = nil) {
        self.location = location
        self.dropPinLocation = dropPinLocation
        self.title = title
        self.subtitle = subtitle
    }
    
    // location, didSet -> address
    
}
