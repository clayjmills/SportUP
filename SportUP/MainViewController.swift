//
//  MainViewController.swift
//  SportUP
//
//  Created by Clay Mills on 4/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var findPickupGameButtonTapped: UIButton!
    
    @IBOutlet weak var createPickupGameButtonTapped: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateViews()
        
//        getICloudUser()

    }
    
    func updateViews() {
        
        self.findPickupGameButtonTapped.backgroundColor = UIColor.lightGray
        self.findPickupGameButtonTapped.layer.cornerRadius = 16
        self.findPickupGameButtonTapped.setTitle("Find Pickup Game", for: .normal)
        
        self.createPickupGameButtonTapped.backgroundColor = UIColor.lightGray
        self.createPickupGameButtonTapped.layer.cornerRadius = 16
        self.createPickupGameButtonTapped.setTitle("Create Pickup Game", for: .normal)
        
        
    }
    
//    func getICloudUser() {
//        
//        CloudKitManager.shared.fetchLoggedInUserRecord { (record, error) in
//            if let error = error {
//                print("There was an error fetching current iCloud user: \(error.localizedDescription)")
//            }
//            
//            guard let record = record else { return }
//            CloudKitManager.shared.fetchUsername(for: record.recordID, completion: { (firstName, lastName) in
//                guard let firstName = firstName,
//                    let lastName = lastName else { return }
//                print(firstName, lastName)
//            })
//        }
//        
//    }
    
//    func getICloudUser() {
//        
//        CloudKitManager.shared.fetchLoggedInUserRecord { (record, error) in
//            if let error = error {
//                print("There was an error fetching current iCloud user: \(error.localizedDescription)")
//            }
//            
//            guard let record = record else { return }
//            
//            let user = User(username: <#T##String#>, referenceToCKUserRecord: <#T##CKReference?#>)
//        }
//
//    }

}
