//
//  ShowSportsCollectionViewCell.swift
//  SportUP
//
//  Created by Clay Mills on 4/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ShowSportsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sportsLabel: UILabel!
    
    var sports: Sports? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        
//        SportsController.shared.sportsList
        
        guard let sports = sports else {return}
        imageView.image = UIImage(named: sports.imageName)
        sportsLabel.text = sports.sportsName 
    }
}
