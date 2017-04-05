//
//  MapViewController.swift
//  SportUP
//
//  Created by Clay Mills on 4/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    // create properties
    var locationManager: CLLocationManager = CLLocationManager()
    var currentLocation: CustomAnnotation?
    var shown: Bool = false
    

    @IBOutlet weak var sportLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        map.delegate = self
        map.showsUserLocation = true
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let _ = "latitude: \(location.coordinate.latitude) longitude: \(location.coordinate.longitude)"
        
            let _ = CustomAnnotation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, name: "My location")
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//create a custom class
class CustomAnnotation: NSObject, MKAnnotation {
    //properties
    var latitude: Double
    var longitude: Double
    var name: String
    
    //memberwise initializer
    init(latitude: Double, longitude: Double, name: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
    }
    //return the coordinate made by latitude and longitude
    var coordinate: CLLocationCoordinate2D {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        return coordinate
    }
    var title: String? {
        return name
    }
}


