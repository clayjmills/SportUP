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
    
    
    @IBOutlet weak var sportLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    // create properties
    var locationManager: CLLocationManager = CLLocationManager()
    var currentLocation: CustomAnnotation?
    var shown: Bool = false
    var sportType: String?
   
    
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
        
        sportLabel.text = sportType
        
        //long press gesture time
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(addPinForNewSport(press:)))
        longPressGestureRecognizer.minimumPressDuration = 0.5
        map.addGestureRecognizer(longPressGestureRecognizer)

    }
    // location delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // passes in didupdatelocations
        let location = locations.last
        // center of the location
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        // map zooms to the region we give it
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        // make sure mapview zooms into the region (animation is for the zoom)
        self.map.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
        
    }
    
    // add the long press gesture recognizer
    func addPinForNewSport(press: UILongPressGestureRecognizer) {
        if press.state == .began {
            //where you touch
            let location = press.location(in: map)
            // get the coordinates
            let coordinates = map.convert(location, toCoordinateFrom: map)
            //give location annotation
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            // fill in the annotation
            annotation.title = "Owner"
            annotation.subtitle = "Time and date"
            
            map.addAnnotation(annotation)
        }
    }

    // set the colors of the pins (blue for user, red for pickup games)
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.canShowCallout = true
        pin.pinTintColor = UIColor.blue
        
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


