//
//  OrderingNetworkService.swift
//  CleanBuddyCoffee
//
//  Created by Uy Cung Dinh on 8/21/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation
import Firebase

class OrderingNetworkService {
    private let db = Firestore.firestore()
}

extension OrderingNetworkService: DeliveryAddressModuleNetworkService {
    func placeOrder(customer: DeliveryAddressModel.Customer, items: [Cart.Item], completion: @escaping (Error?) -> Void) {
        var itemsData: [[String: Any]] = []
        for item in items {
            let itemData: [String: Any] = ["name": item.name, "price": item.price, "quantity": item.quantity]
            itemsData.append(itemData)
        }
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        let dateString = dateFormatter.string(from: date)
        
        let orderData: [String: Any] = [
            "email": customer.email,
            "name": customer.name,
            "phone": customer.phone,
            "address": customer.address,
            "items": itemsData,
            "date": dateString
        ]
        
        db.collection("orders").addDocument(data: orderData) { err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        }
    }
}
