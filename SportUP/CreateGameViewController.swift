//
//  CreateGameViewController.swift
//  SportUP
//
//  Created by Clay Mills on 4/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit

class CreateGameViewController: UIViewController {
    
    
    @IBOutlet weak var sportsListPickerView: UIPickerView!
    @IBOutlet weak var ownerTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
//    var sportsNames = [SportsListArray]()
//  
    override func viewDidLoad() {
       super.viewDidLoad()
        self.hideKeyboard()
//        
//        sportsListPickerView.delegate = self
//        sportsListPickerView.dataSource = self
    }
    
    @IBAction func saveGameButtonTapped(_ sender: Any) {
    }
//    
//    
////    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
////        return sportsNames[indexPath.row]
////    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return sportsNames.count
//    }
//    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
//        
//        return 1
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
