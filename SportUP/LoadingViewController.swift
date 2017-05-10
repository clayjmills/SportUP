//
//  LoadingViewController.swift
//  SportUP
//
//  Created by Clay Mills on 5/8/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchUser()
    }
    
    func presentUsernameAlertController() {
        
        let alertController = UIAlertController(title: "Welcome to SportUP please create a username", message: nil, preferredStyle: .alert)
        var usernameTextField: UITextField?
        alertController.addTextField { (textField) in
            textField.placeholder = "Username"
            usernameTextField = textField
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { (_) in
            guard let username = usernameTextField?.text, username != "" else { self.presentNoUsernameAlert(); return }
            UserController.shared.newUserUsername = username
            self.fetchUser()
        })
        alertController.addAction(submitAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func presentNoUsernameAlert() {
    
        let alertController = UIAlertController(title: "Oops", message: "Please create a username", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: { (_) in
            self.presentUsernameAlertController()
        })
        alertController.addAction(okayAction)
    }
    
    func fetchUser() {
        
        UserController.shared.fetchLoggedInUser { (success) in
            
            DispatchQueue.main.async {
                if success {
                    self.performSegue(withIdentifier: "toMainView", sender: self)
                } else {
                    self.presentUsernameAlertController()
                }
            }
        }
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
