//
//  CreateGameViewController.swift
//  SportUP
//
//  Created by Clay Mills on 4/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit

class CreateGameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var sportsListPickerView: UIPickerView!
    @IBOutlet weak var ownerTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    // put in variable property for PickupGame.swift
    
    override func viewDidLoad() {
       super.viewDidLoad()
        self.hideKeyboard()
        
        sportsListPickerView.delegate = self
        sportsListPickerView.dataSource = self
        
        
    }
    
    @IBAction func saveGameButtonTapped(_ sender: Any) {
    }
//    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SportsListArray.sportsNames.count
    }
//
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let string = SportsListArray.sportsNames[row]
        
        return string
    }

}
// hides the keyboard
extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
