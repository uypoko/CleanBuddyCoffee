//
//  DrinkService.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/15/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation
import Firebase

class MenuNetworkService: ListDrinksService {
    
    let db = Firestore.firestore()
    let storageRef = Storage.storage().reference()
    
    func fetchDrinks(completion: @escaping ([ListDrinks.Drink]?) -> Void) {
        var drinks: [ListDrinks.Drink] = []
        db.collection("drinks").getDocuments { (querySnapshot, err) in
            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    let id = document.documentID
                    guard let nameData = document.data()["name"], let name = nameData as? String else { continue }
                    guard let priceData = document.data()["price"], let price = priceData as? Int else { continue }
                    let drink = ListDrinks.Drink(id: id, name: name, price: price)
                    drinks.append(drink)
                }
                completion(drinks)
            } else {
                completion(nil)
            }
        }
    }
    
    func fetchDrinkImage(drinkName: String, completion: @escaping (Data?) -> Void) {
        let imgRef = storageRef.child("drink_images/\(drinkName).jpg")
        imgRef.getData(maxSize: 1 * 1024 * 1024) { data, _ in
            if let data = data {
                completion(data)
            } else {
                completion(nil)
            }
        }
    }
    
}

extension MenuNetworkService: DrinkDetailService {
    
    func fetchDrink(for id: String, completion: @escaping (DrinkDetail.Drink?) -> Void) {
        db.collection("drinks").document(id).getDocument { snapshot, _ in
            if let snapshot = snapshot, let data = snapshot.data() {
                let name = (data["name"] as? String) ?? ""
                let description = (data["description"] as? String) ?? ""
                let price = (data["price"] as? Int) ?? 0
                let drink = DrinkDetail.Drink(id: id, name: name, description: description, price: price)
                completion(drink)
            } else {
                completion(nil)
            }
        }
    }
    
    func fetchDrinkDetailImage(drinkId: String, completion: @escaping (Data?) -> Void) {
        let imgRef = storageRef.child("drink_images/\(drinkId).jpg")
        imgRef.getData(maxSize: 5 * 1024 * 1024) { data, _ in
            if let data = data {
                completion(data)
            } else {
                completion(nil)
            }
        }
    }
    
}

extension MenuNetworkService: CartNetworkService {
    func fetchDrinks(drinkIds: [String], completion: @escaping ([Cart.FetchedItem]?) -> Void) {
        var cartItems: [Cart.FetchedItem] = []
        for id in drinkIds {
            db.collection("drinks").document(id).getDocument { snapshot, _ in
                if let snapshot = snapshot, let data = snapshot.data() {
                    let name = (data["name"] as? String) ?? ""
                    guard let priceData = data["price"], let price = priceData as? Int else { return }
                    let item = Cart.FetchedItem(id: id, name: name, price: price)
                    cartItems.append(item)
                    completion(cartItems)
                } else {
                    completion(nil)
                }
            }
        }
        
    }
    
    
}
