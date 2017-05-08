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
    @IBOutlet weak var saveDateButtonTapped: UIButton!
    
    @IBOutlet weak var viewDateTextField: UITextField!
    @IBOutlet weak var toMapViewButtonTapped: UIButton!
    
    var pickerSelectedSport: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews()
        
        sportsListPickerView.delegate = self
        sportsListPickerView.dataSource = self
        
    }
    // save datepicker info to textfield
    @IBAction func saveDateButtonTapped(_ sender: Any) {
        viewDateTextField.text = DateFormatter.localizedString(from: datePickerView.date, dateStyle: DateFormatter.Style.long, timeStyle: DateFormatter.Style.short)
    }
        
    func updateViews() {
        
        // button to save date picker
        self.saveDateButtonTapped.backgroundColor = UIColor.lightGray
        self.saveDateButtonTapped.layer.cornerRadius = 5
        self.saveDateButtonTapped.setTitleColor(UIColor.white, for: .normal)
        
        // button to mapView
        self.toMapViewButtonTapped.setBackgroundImage(#imageLiteral(resourceName: "mapScreenShot"), for: .normal)
        self.toMapViewButtonTapped.layer.cornerRadius = 5
        self.toMapViewButtonTapped.setTitle("", for: .normal)
        
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let sportName = SportsListArray.sportsNames[row]
        self.pickerSelectedSport = sportName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSportPickerMapView" {
            let sportPickerMapVC = segue.destination as? MapViewController
            sportPickerMapVC?.sportType = self.pickerSelectedSport
        }
    }
    
}
