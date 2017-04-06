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
        
// conforms it to delegate method
        locationManager.delegate = self
        // use location services only when app is on (not in background)
        locationManager.requestWhenInUseAuthorization()
        // turns on location manager to look for location
        locationManager.startUpdatingLocation()
        
        //show location on map (location delegate methods)
        map.delegate = self
        // shows user location
        map.showsUserLocation = true

    }
    // location delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // passes in didupdatelocations
        let location = locations.last
        // center of the location
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        // map zooms to this region we give it
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        // make sure mapview zooms into the region (animation is for the zoom)
        self.map.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
        
    }
    // set the colors of the pins (green for user, red for pickup games)
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.canShowCallout = true
        pin.pinTintColor = UIColor.green
        
        if let title = annotation.title {
            if title == "My location" {
                pin.pinTintColor = UIColor.red
            }
        }
        return pin
    }

}

////create a custom class
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


