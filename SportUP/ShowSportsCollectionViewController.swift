//
//  ShowSportsCollectionViewController.swift
//  SportUP
//
//  Created by Clay Mills on 4/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

private let reuseIdentifier = "sportsListCell"

class ShowSportsCollectionViewController: UICollectionViewController {
    
    var sportsList: [Sports] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sportsList = SportsController.shared.createAllSports()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sportsList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShowSportsCollectionViewCell else {return UICollectionViewCell()}
        
        let sports = self.sportsList[indexPath.row]
        cell.sports = sports
        return cell 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMapVC" {
            guard let indexPath = collectionView?.indexPathsForSelectedItems?.first,
                let mapVC = segue.destination as? MapViewController else {return}
            let sportLabel = SportsListArray.sportsNames[indexPath.row + 1]
            mapVC.sportType = sportLabel
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sportType = SportsListArray.sportsNames[indexPath.row + 1]
        
        PickupGameController.shared.fetchPickupGameFromCloudKit(sportType: sportType) { (pickupGames) in
            // FIXME: Do i need to add anything here?
        }
    }
}
