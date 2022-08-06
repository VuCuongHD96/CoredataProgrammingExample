//
//  CoredataManager.swift
//  CoredataProgrammingExample
//
//  Created by Sun on 06/08/2022.
//

import CoreData

class CoredataManager {
    
    func entityDescription() -> NSEntityDescription {
        let entity = NSEntityDescription()
        entity.name = "ExampleEntity"
        entity.managedObjectClassName = NSStringFromClass(ExampleEntity.self)

        let nameAttr = NSAttributeDescription()
        nameAttr.name = "name"
        nameAttr.attributeType = .stringAttributeType
        nameAttr.isOptional = true
        
        let dateAttr = NSAttributeDescription()
        dateAttr.name = "date"
        dateAttr.attributeType = .dateAttributeType
        
        entity.properties = [nameAttr,
                             dateAttr]
        return entity
    }
    
    func managedObjectModel() -> NSManagedObjectModel {
        let model = NSManagedObjectModel()
        model.entities = [entityDescription()]
        return model
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentCloudKitContainer(name: "ExampleModel", managedObjectModel: managedObjectModel())
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy public var viewContext = persistentContainer.viewContext
    
    func save() {
        let entity = ExampleEntity(context: viewContext)
        entity.name = "Cương"
        entity.date = Date.init()
        
        do {
            try viewContext.save()
        } catch {
            print("------- debug ------ error = ", error)
        }
    }
    
    func fetch() {
        let request = ExampleEntity.fetchRequest()
        let item = try? viewContext.fetch(request)
        item?.forEach { item in
            print("\n\n---- debug ---- item name = ", item.name)
            print("---- debug ---- item date = ", item.date)
        }
    }
}
