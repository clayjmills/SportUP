//
//  CreateGameViewController.swift
//  SportUP
//
//  Created by Clay Mills on 4/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit

class CreateGameViewController: UIViewController, UIPickerViewDelegate {
    
    
    @IBOutlet weak var sportsListPickerView: UIPickerView!
    
    @IBOutlet weak var ownerTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    
//    var sportsList = SportsHelper[IndexPath]
//    let picker = UIPickerView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        picker.delegate = self
//        picker.dataSource = self
//        
//        sportsListPickerView.inputView = picker
//    }
//    
//    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return SportsHelper.imageName.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return SportsHelper[row]
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        sportsListPickerView.text = SportsHelper[row]
//        self.view.endEditing(false)
//    }
    
    
    @IBAction func saveGameButtonTapped(_ sender: Any) {
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
