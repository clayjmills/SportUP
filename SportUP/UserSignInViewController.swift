//
//  UserSignInViewController.swift
//  SportUP
//
//  Created by Clay Mills on 5/8/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit

class UserSignInViewController: UIViewController {
    
    @IBOutlet weak var createUsernameTextField: UITextField!
    @IBOutlet weak var loginButtonTapped: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        
    }
    
// Keyboard
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    // have textfields stay on top of keyboard
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if (textField == ownerTextField){
//            ScrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)
//        } else if textField == toMapViewButtonTapped {
//            self.ScrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)
//        }
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        ScrollView.setContentOffset(CGPoint(x:0,y:0), animated: true)
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
