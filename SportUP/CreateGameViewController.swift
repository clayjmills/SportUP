//
//  CreateGameViewController.swift
//  SportUP
//
//  Created by Clay Mills on 4/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit

class CreateGameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var sportsListPickerView: UIPickerView!
    @IBOutlet weak var ownerTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var saveGameButtonTapped: UIButton!
    @IBOutlet weak var toMapViewButtonTapped: UIButton!
    // put in variable property for PickupGame.swift
    
    override func viewDidLoad() {
       super.viewDidLoad()
        self.updateViews()
        
        sportsListPickerView.delegate = self
        sportsListPickerView.dataSource = self
    }
    @IBAction func saveGameButtonTapped(_ sender: Any) {
    }
    
    func updateViews() {
        self.saveGameButtonTapped.backgroundColor = UIColor.lightGray
        self.saveGameButtonTapped.layer.cornerRadius = 16
        self.saveGameButtonTapped.setTitle("Save New Pickup Game", for: .normal)
        
        self.toMapViewButtonTapped.backgroundColor = UIColor.lightGray
        self.toMapViewButtonTapped.layer.cornerRadius = 5
        self.toMapViewButtonTapped.setTitle("Pick Location for Game", for: .normal)

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
        }   else if textField == dateTextField {
            self.ScrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)
         } else if textField == timeTextField {
            self.ScrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)
//        } else if textField == locationTextField {
//            self.ScrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)
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
    // how many rows/cells do we need to load all of our array? use arrayName.count to make a row for every item in the array.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SportsListArray.sportsNames.count
    }
// grab the name out of the array and display it.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let string = SportsListArray.sportsNames[row]
        
        return string
    }

}
