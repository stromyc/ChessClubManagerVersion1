//
//  MatchEntity+CoreDataProperties.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/27/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import Foundation
import CoreData



@objc(MatchEntity)
class MatchEntity: NSManagedObject {



    @NSManaged public var matchOutcome: String?
    @NSManaged public var matchDate: NSDate?
    @NSManaged public var club: ClubEntity?

}
