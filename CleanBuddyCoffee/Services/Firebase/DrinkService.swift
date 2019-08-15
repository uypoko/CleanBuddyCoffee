//
//  DrinkService.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/15/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation
import Firebase

class DrinkService {
    
    let db = Firestore.firestore()
    let storageRef = Storage.storage().reference()
    
    func fetchDrinks(completion: @escaping ([Drink]?) -> Void) {
        var drinks: [Drink] = []
        db.collection("drinks").getDocuments { (querySnapshot, err) in
            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    let id = document.documentID
                    guard let nameData = document.data()["name"], let name = nameData as? String else { continue }
                    guard let descriptionData = document.data()["description"], let description = descriptionData as? String else { continue }
                    guard let priceData = document.data()["price"], let price = priceData as? Int else { continue }
                    guard let categoryData = document.data()["category"], let category = categoryData as? String else { continue }
                    let drink = Drink(id: id, name: name, category: category, price: price, description: description, imageData: nil)
                    drinks.append(drink)
                }
                completion(drinks)
            } else {
                completion(nil)
            }
        }
    }
}
