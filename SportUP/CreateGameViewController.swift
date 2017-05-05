//
//  CreateGameViewController.swift
//  SportUP
//
//  Created by Clay Mills on 4/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CreateGameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var sportsListPickerView: UIPickerView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    @IBOutlet weak var ownerTextField: UITextField!
    @IBOutlet weak var toMapViewButtonTapped: UIButton!
    //    @IBOutlet weak var saveGameButtonTapped: UIButton!
    
    // put in variable property for PickupGame.swift
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews()
        
        sportsListPickerView.delegate = self
        sportsListPickerView.dataSource = self
        
        
    }
    // call the alert
    override func viewDidAppear(_ animated: Bool) {
        createAlert(title: "Hey!", message: "Fill out all text fields")
    }
    
    @IBAction func mapViewButtonTapped(_ sender: Any) {
        
    }
    
    // alert controller for map button if text fields are not all filled in
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateViews() {
        
        self.toMapViewButtonTapped.setBackgroundImage(#imageLiteral(resourceName: "mapScreenShot"), for: .normal)
        self.toMapViewButtonTapped.layer.cornerRadius = 5
        self.toMapViewButtonTapped.setTitle("", for: .normal)
        
    }
    
    // Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // have textfields stay on top of keyboard
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == ownerTextField){
            ScrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)
        } else if textField == toMapViewButtonTapped {
            self.ScrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        ScrollView.setContentOffset(CGPoint(x:0,y:0), animated: true)
    }
    
    // pulling array of sports labels into the pickerview
    // components =
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // how many rows/cells do we need to load out of our array? use 'arrayName'.count to make a row for every item in the array.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SportsListArray.sportsNames.count
    }
    // grab the name out of the array and display it.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let string = SportsListArray.sportsNames[row]
        
        return string
    }
    
    // segue to map from pickerView
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "toSportPickerMapView" {
    //            guard let indexPath = collectionView?.indexPathsForSelectedItems?.first,
    //                let mapVC = segue.destination as? MapViewController else {return}
    //            let sportLabel = SportsListArray.sportsNames[indexPath.row]
    //            mapVC.sportType = sportLabel
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "toSportPickerMapView" {
    //            guard let indexPath = sportsListPickerView.numberOfRows(inComponent: [row]),
    //            let mapCreateVC = segue.destination as? MapViewController else {return}
    //            let sportLabel = SportsListArray.sportsNames[indexPath.row]
    //            mapCreateVC.sportType = sportLabel
    //        }
    //    }
    
}
