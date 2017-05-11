//
//  SportsController.swift
//  SportUP
//
//  Created by Clay Mills on 4/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import Foundation

class SportsController {
    
    static let shared = SportsController()
    
    var sportsList: [Sports] = []
    
    init() {
        self.sportsList = createAllSports()
        
    }
    
    
    func createAllSports() -> [Sports] {
        
        var placeHolderSports: [Sports] = []
        
        for sportsName in SportsListArray.sportsNames {
            
            guard let index = SportsListArray.sportsNames.index(of: sportsName) else {return []}
            
            if index > 0 {
                
                let imageNames = SportsListArray.imageName[index - 1]
                
                let sports = Sports(sportsName: sportsName, imageName: imageNames)
                
                placeHolderSports.append(sports)
            }
        }
        return placeHolderSports
    }
    

}
//func fetchRecordsWithType(_ type: String,
//                          predicate: NSPredicate = NSPredicate(value: true),
//                          recordFetchedBlock: ((_ record: CKRecord) -> Void)?,
//                          completion: ((_ records: [CKRecord]?, _ error: Error?) -> Void)?) {
//
//    var fetchedRecords: [CKRecord] = []
//
//    let query = CKQuery(recordType: type, predicate: predicate)
//    let queryOperation = CKQueryOperation(query: query)
//
//    let perRecordBlock = { (fetchedRecord: CKRecord) -> Void in
//        fetchedRecords.append(fetchedRecord)
//        recordFetchedBlock?(fetchedRecord)
//    }
//    queryOperation.recordFetchedBlock = perRecordBlock
//
//    var queryCompletionBlock: (CKQueryCursor?, Error?) -> Void = { (_, _) in }
//
//    queryCompletionBlock = { (queryCursor: CKQueryCursor?, error: Error?) -> Void in
//
//        if let queryCursor = queryCursor {
//            // there are more results, go fetch them
//
//            let continuedQueryOperation = CKQueryOperation(cursor: queryCursor)
//            continuedQueryOperation.recordFetchedBlock = perRecordBlock
//            continuedQueryOperation.queryCompletionBlock = queryCompletionBlock
//
//            self.publicDatabase.add(continuedQueryOperation)
//
//        } else {
//            completion?(fetchedRecords, error)
//        }
//    }
//    queryOperation.queryCompletionBlock = queryCompletionBlock
//
//    self.publicDatabase.add(queryOperation)
//}

