//
//  CoreDataStore.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/26/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStore {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "OrderCoreDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

extension CoreDataStore: CoreDataStoreProtocol {
    
    func createOrder(orderId: String, email: String, name: String, date: Date, address: String) {
        let context = persistentContainer.viewContext
        let orderEntity = NSEntityDescription.entity(forEntityName: "Order", in: context)!
        
        let order = NSManagedObject(entity: orderEntity, insertInto: context)
        order.setValue(orderId, forKey: "orderId")
        order.setValue(email, forKey: "email")
        order.setValue(name, forKey: "name")
        order.setValue(date, forKey: "date")
        order.setValue(address, forKey: "address")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchOrder() -> [Order]? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Order")
        do {
            let result = try context.fetch(fetchRequest) as! [Order]
            return result
        } catch let error as NSError {
            print("Could not retrieve data. \(error), \(error.userInfo)")
            return nil
        }
    }
    
}
