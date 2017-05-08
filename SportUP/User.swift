//
//  User.swift
//  SportUP
//
//  Created by Clay Mills on 5/5/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import Foundation
import CloudKit

class User {
    
    var username: String
    var recordID: CKRecordID?
    var referenceToCKUserRecord: CKReference?
    
    init(username: String, referenceToCKUserRecord: CKReference?) {
        
        self.username = username
        self.referenceToCKUserRecord = referenceToCKUserRecord
    }
    
    init?(ckrecord: CKRecord) {
        guard let username = ckrecord["username"] as? String,
            let reference = ckrecord["referenceToCKUserRecord"] as? CKReference
            else { return nil }
        
        self.username = username
        self.referenceToCKUserRecord = reference
    }
}

extension CKRecord {
    
    convenience init(user: User) {
        let recordID = user.recordID ?? CKRecordID(recordName: UUID().uuidString)
        self.init(recordType: "User", recordID: recordID)
    }
}
