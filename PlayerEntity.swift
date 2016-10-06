//
//  PlayerEntity.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/27/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import Foundation
import CoreData

@objc(PlayerEntity)
class PlayerEntity : NSManagedObject {



    @NSManaged public var clubID: String?
    @NSManaged public var displayOrder: NSNumber
    @NSManaged public var draws: NSNumber?
    @NSManaged public var email: String?
    @NSManaged public var losses: NSNumber?
    @NSManaged public var wins: NSNumber?
    @NSManaged public var name: String?
    @NSManaged public var score: Double
    @NSManaged public var club: ClubEntity?

}
