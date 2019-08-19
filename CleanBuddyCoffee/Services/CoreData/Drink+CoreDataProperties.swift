//
//  Drink+CoreDataProperties.swift
//  
//
//  Created by Ryan on 8/19/19.
//
//

import Foundation
import CoreData


extension Drink {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drink> {
        return NSFetchRequest<Drink>(entityName: "Drink")
    }

    @NSManaged public var drinkId: String?
    @NSManaged public var quantity: Int16

}
