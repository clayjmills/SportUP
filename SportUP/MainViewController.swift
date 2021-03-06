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
    }
    
    func updateViews() {
                
      //  self.findPickupGameButtonTapped.backgroundColor = UIColor.blue
        self.findPickupGameButtonTapped.layer.cornerRadius = 16
        self.findPickupGameButtonTapped.setTitle("Find Pickup Game", for: .normal)
        
     //   self.createPickupGameButtonTapped.backgroundColor = UIColor.blue
        self.createPickupGameButtonTapped.layer.cornerRadius = 16
        self.createPickupGameButtonTapped.setTitle("Create Pickup Game", for: .normal)
    }
}
