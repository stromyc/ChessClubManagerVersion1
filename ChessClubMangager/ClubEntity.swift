//
//  ClubEntity.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/27/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import Foundation
import CoreData


@objc(ClubEntity)
class ClubEntity : NSManagedObject {
    
    
    @NSManaged var clubName: String?
    @NSManaged var displayOrder: NSNumber
    @NSManaged var clubDirector: String?
    @NSManaged var players: NSSet?
    @NSManaged var match: NSSet?
}
