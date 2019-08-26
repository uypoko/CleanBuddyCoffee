//
//  Order+CoreDataProperties.swift
//  
//
//  Created by Ryan on 8/26/19.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var address: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var orderId: String?

}
