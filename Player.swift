//
//  Player.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/27/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import Foundation
import CoreData


class Player<T:PlayerEntity>: ABusinessObject<T> {
    
    // Code to add functionality to managed object subclass.
    var entityList: Array<T>!
    
    override init() {
        super.init()
    }
    
    func getAllEntitiesByDisplayOrder() -> Array<T> {
        
        let sortDescriptor = NSSortDescriptor(key: "displayOrder", ascending: true)
        self.entityList = self.getAllEntitiesSortedBy(sortDescriptor)
        return self.entityList!
    }
    
    func getPlayersWithClubID (_ clubID: String) -> Array<T> {
        
        let predicate = NSPredicate(format: "clubID = %@", clubID)
        self.entityList = self.getEntitiesMatchingPredicate(predicate)
        
        return self.entityList!
    }
    // MARK: Move player display order.
    // Move the object at the source index path to the destination index path
    func moveObjectAtIndexPath(_ sourceIndexPath: IndexPath, destinationIndexPath: IndexPath) {
        
        let from = (sourceIndexPath as NSIndexPath).row
        let to = (destinationIndexPath as NSIndexPath).row
        
        if from == to {
            return
        }
        
        // Get the entity to be reordered, remove it from
        // its old position and add it in its new position
        let toDoEntity = self.entityList[from]
        self.entityList.remove(at: from)
        self.entityList.insert(toDoEntity, at: to)
        
        // Set the new order of the object
        var lower = 0.0
        var upper = 0.0
        
        // Check for an item before it
        if to > 0 {
            lower = Double(self.entityList[to-1].displayOrder)
        }
        else {
            lower = Double(self.entityList[1].displayOrder) - 2.0
        }
        
        // Check for an item after it
        if to < self.entityList.count - 1 {
            upper = Double(self.entityList[to + 1].displayOrder)
        }
        else {
            upper = Double(self.entityList[to - 1].displayOrder) + 2.0
        }
        
        // Add the upper and lower, divide by two
        // to derive the new order
        let newOrder = (lower + upper) / 2.0
        toDoEntity.displayOrder = newOrder as NSNumber
        
        //toDoEntity.displayOrder = NSNumber(value: newOrder)

    }
    
    // MARK: Remove Player
    
    func removeObjectAtIndexPath(_ indexPath: IndexPath) {
        self.entityList.remove(at: (indexPath as NSIndexPath).row)
    }
    
    // MARK: Create new player Object at specified index path
    // Adds a new player entity and associated club.
    
    func addItemToList(_ desc: String, club:String) -> PlayerEntity {
        print("PlayerAddedToStore")
        let playerEntity = self.createEntity()
        playerEntity.name = desc
        playerEntity.clubID = club
        
        // Make Player Club relationship/association
        
        let playerWithClub = playerEntity.club
        playerWithClub?.setValue("Testing Club Name Entry", forKey: "clubName")
        
        // Update display order for new entry.
        playerEntity.displayOrder = self.entityList.count + 1 as NSNumber
        
        // Save updates
        self.saveEntities()
        self.entityList.append(playerEntity)
        return playerEntity
    }
    
    override func deleteEntity(_ entity: T) {
        super.deleteEntity(entity)
        self.saveEntities()
    }
    
    
}
