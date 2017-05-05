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
    
    @IBOutlet weak var pinLocationLabel: UILabel!
    @IBOutlet weak var dropPinLocationLabel: UILabel!
    
    // create properties
    var locationManager: CLLocationManager = CLLocationManager()
    var currentLocation: CustomAnnotation?
    var shown: Bool = false
    var sportType: String?
    var owner: String?
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // conforms it to delegate method
        locationManager.delegate = self
        // use location services only when app is on (not in background)
        locationManager.requestWhenInUseAuthorization()
        // turns on location manager to look for location
        locationManager.startUpdatingLocation()
        //desired accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
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
    //save game button
    @IBAction func saveGameButtonTapped(_ sender: Any) {
    }
    
    
    // location delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // passes in didupdatelocations
        let location = locations[0]
        // center of the location
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        // map zooms to the region we give it
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        // make sure mapview zooms into the region (animation is for the zoom)
        self.map.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
        
        self.map.showsUserLocation = true
        
        //reverse geocoding to get address for locations
        CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
            if error != nil
            {
                print ("There was an error")
            }
            else
            {
                if let place = placemark?[0] {
                    self.pinLocationLabel.text = place.name
                }
            }
        }
    }
    
    // add the long press gesture recognizer for pin drop
    func addPinForNewSport(press: UILongPressGestureRecognizer) {
        if press.state == .began {
            //where you touch
            let point = press.location(in: map)
            // get the coordinates
            let coordinates = map.convert(point, toCoordinateFrom: map)
            //give location annotation
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            // fill in the annotation
            annotation.title = "owner"
            annotation.subtitle = "self.viewDateTextField.text"
            //add the annotation
            map.addAnnotation(annotation)
            
            
            let location = CLLocation(latitude: annotation.coordinate.latitude, longitude: annotation.coordinate.longitude)
            
            //reverse geocoding to get address for droppedPin
            CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
                if let error = error
                {
                    print ("There was an error: \(error.localizedDescription)")
                    return
                }
                
                guard let placemark = placemarks?.first else { return }
                
                if let name = placemark.addressDictionary?["Name"] as? String {
                    self.dropPinLocationLabel.text = name
                }
            }
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


