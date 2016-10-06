//
//  ABusinessObject.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/26/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import Foundation
import CoreData

class ABusinessObject<T: NSManagedObject>: mmBusinessObject<T> {
    
    override init() {
        super.init()
        
        self.dbName = "ChessClubManager"
        self.copyDatabaseIfNotPresent = true
    }
    
    
    
    
    
    
}
