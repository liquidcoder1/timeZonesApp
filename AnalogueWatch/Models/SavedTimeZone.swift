//
//  SavedTimeZone.swift
//  AnalogueWatch
//
//  Created by John K on 01/12/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import Foundation
import CoreData

public class SavedTimeZone: NSManagedObject, Identifiable{
     @NSManaged public var id: UUID?
     @NSManaged public var createdAt: Date?
     @NSManaged public var area: String?
     @NSManaged public var location: String?
     @NSManaged public var utcOffset: String?
}


extension SavedTimeZone{
    static func getAll() -> NSFetchRequest<SavedTimeZone> {
        
         let request: NSFetchRequest<SavedTimeZone> = SavedTimeZone.fetchRequest() as! NSFetchRequest<SavedTimeZone>
          
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
