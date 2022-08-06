//
//  ExampleEntity.swift
//  MagicalRecordExample
//
//  Created by Sun on 06/08/2022.
//

import Foundation
import CoreData

public final class ExampleEntity: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var date: Date
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExampleEntity> {
        return NSFetchRequest<ExampleEntity>(entityName: "ExampleEntity")
    }
}
