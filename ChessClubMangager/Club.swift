//
//  Club.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/27/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import Foundation
import CoreData

class Club<T: ClubEntity>: ABusinessObject<T> {
    
    
    // Insert code here to add functionality to your managed object subclass
    
    var entityList: Array<T>!
    
    override init() {
        super.init()
    }
    
    // Get all entities sorted by display order
    func getAllEntitiesByDisplayOrder() -> Array<T> {
        
        let sortDescriptor = NSSortDescriptor(key: "displayOrder", ascending: true)
        self.entityList = self.getAllEntitiesSortedBy(sortDescriptor)
        return self.entityList!
    }
    
    // Remove the object at the specified index path
    func removeObjectAtIndexPath(_ indexPath: IndexPath) {
        self.entityList.remove(at: (indexPath as NSIndexPath).row)
    }
    
    
    func removeObjectsAtIndexPaths(_ indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            
            self.entityList.remove(at: (indexPath as NSIndexPath).row)
        }
        
    }
    
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
        //toDoEntity.displayOrder = NSNumber(newOrder)
        toDoEntity.displayOrder = newOrder as NSNumber
    }
    
    
    // MARK: Create new club entity.
    func addItemToList(_ desc: String) -> ClubEntity {
        let clubEntity = self.createEntity()
        clubEntity.clubName = "Test Line For Club Name"
        //clubEntity.clubDirector = directorDesc
        clubEntity.displayOrder = self.entityList.count + 1 as NSNumber
        self.saveEntities()
        print("Save Club called")
        self.entityList.append(clubEntity)
        print("Append club?")
        return clubEntity
        
    }
    
    // MARK: Create new club entity with Name and Director
    func createNewClub(withName nameDesc: String, andDirector dirDesc: String) -> ClubEntity {
        let clubEntity = self.createEntity()
        clubEntity.clubName = nameDesc
        clubEntity.clubDirector = dirDesc
        clubEntity.displayOrder = self.entityList.count + 1 as NSNumber
        self.saveEntities()
        self.entityList.append(clubEntity)
        return clubEntity
    }
    
    // Delete the specified entity
    override func deleteEntity(_ entity: T) {
        super.deleteEntity(entity)
        self.saveEntities()
    }
    
    
}
