//
//  MapViewController.swift
//  SportUP
//
//  Created by Clay Mills on 4/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit
import CloudKit
import CoreLocation
import MapKit


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UIPickerViewDelegate {
    
    @IBOutlet weak var sportLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var pinLocationLabel: UILabel!
    @IBOutlet weak var dropPinLocationLabel: UILabel!
    
    // create properties
    var locationManager: CLLocationManager = CLLocationManager()
    var currentLocation: CustomAnnotation?
    var shown: Bool = false
    var sportType: String?
    var date: Date?
    var annotations: [MKPointAnnotation] = []
    var pinDroppedLocation: CLLocation?
    
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
        
        guard let sportType = sportType else { return }
        dropPinsFor(sport: sportType)
        
        //long press gesture time
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(addPinForNewSport(press:)))
        longPressGestureRecognizer.minimumPressDuration = 0.5
        map.addGestureRecognizer(longPressGestureRecognizer)
        
    }
    // save game button. add alert that says "congrats on making game"
    @IBAction func saveGameButtonTapped(_ sender: Any) {
        
        guard let sport = self.sportType,
            let date = self.date,
            let userID = UserController.shared.currentUser?.recordID,
            let location = self.pinDroppedLocation
            else { return }
        
        let userRef = CKReference(recordID: userID, action: .none)
        let newGame = PickupGame(sport: sport, ownerRef: userRef, date: date, location: location)
        
        PickupGameController.shared.savePickUpGameToCloudKit(pickUpGame: newGame) { (success) in
            
            DispatchQueue.main.async {
                
                if success {
                    
                    let alertController = UIAlertController(title: "Your game has been saved", message: "Go play", preferredStyle: .alert)
                    self.present(alertController, animated: true, completion: nil)
                    let doneAction = UIAlertAction(title: "Done", style: .default, handler: { (_) in
                        _ = self.navigationController?.popToRootViewController(animated: true)
                    })
                    alertController.addAction(doneAction)
                } else {
                    print("Error saving pickup game")
                }
            }
        }
    }
    
    // location delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // passes in didupdatelocations
        let location = locations[0]
        // center of the location at user current loation
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        // map zooms to the region we give it
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
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
                    self.pinLocationLabel.text = place.thoroughfare
                }
            }
        }
    }
    
    // add the long press gesture recognizer for pin drop
    func addPinForNewSport(press: UILongPressGestureRecognizer) {
        
        if press.state == .began {
            map.removeAnnotations(annotations)
            self.annotations = []
            //where you touch
            let point = press.location(in: map)
            // get the coordinates
            let coordinates = map.convert(point, toCoordinateFrom: map)
            //give location annotation
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            annotation.title = "owner"
            annotation.subtitle = "city"
            self.annotations.append(annotation)
            //add the annotation
            map.addAnnotations(self.annotations)
            // get location
            let location = CLLocation(latitude: annotation.coordinate.latitude, longitude: annotation.coordinate.longitude)
            
            //reverse geocoding to get address for droppedPin
            CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
                if let error = error
                {
                    print ("There was an error: \(error.localizedDescription)")
                    return
                }
                
                guard let placemark = placemarks?.first else { return }
                
                if let name = placemark.addressDictionary?["Name"] as? String,
                    let thoroughfare = placemark.addressDictionary?["City"] as? String {
                    self.dropPinLocationLabel.text = name
                    self.dropPinLocationLabel.text = thoroughfare
                    annotation.title = name
                    annotation.subtitle = thoroughfare
                    self.pinDroppedLocation = location
                }
            }
        }
    }
    
    // set the colors of the pins (blue for user, red for pickup games), fill the annotation with needed info
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //make user location (pin) blue
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.canShowCallout = true
        pin.pinTintColor = UIColor.blue
        //make color of dropped pins red
        if let title = annotation.title {
            if title == "owner" {
                pin.pinTintColor = UIColor.red
            }
        }
        return pin
    }
    //to show pickup game pins on map
    
    func dropPinsFor(sport: String) {
        
        PickupGameController.shared.fetchPickupGameFromCloudKit(sportType: sport) { (pickupGames) in
            for pickupGame in pickupGames {
                //give location annotation
                let annotation = MKPointAnnotation()
                // get location
                let location = pickupGame.location.coordinate
                annotation.coordinate = location
                annotation.title = "owner"
                annotation.subtitle = "city"
                self.annotations.append(annotation)

            }
            //add the annotation
            DispatchQueue.main.async {
                self.map.addAnnotations(self.annotations)
            }
        }
    }
}
////create a custom class
class CustomAnnotation: NSObject, MKAnnotation {
    //properties
    var latitude: Double
    var longitude: Double
    var name: String
    var thoroughfare: String
    
    //memberwise initializer
    init(latitude: Double, longitude: Double, name: String, thoroughfare: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.thoroughfare = thoroughfare
    }
    //return the coordinate made by latitude and longitude
    var coordinate: CLLocationCoordinate2D {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        return coordinate
    }
    var title: String? {
        return name
    }
    var subtitle: String? {
        return thoroughfare
    }
}
