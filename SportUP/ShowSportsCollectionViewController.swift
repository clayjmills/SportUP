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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SportsController.shared.sportsList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShowSportsCollectionViewCell else {return UICollectionViewCell()}
        
        let sports = SportsController.shared.sportsList[indexPath.row]
        cell.sports = sports
        return cell 
    }
    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return SportsListArray.sportsNames.count
//    }
//    // grab the name out of the ray and display it.
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        
//        let string = SportsListArray.sportsNames[row]
//        
//        return string
//    }

}
