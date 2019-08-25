//
//  CartItem.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/19/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

class CartItem: Codable {
    let id: String
    var name: String
    var price: Int
    var quantity: Int
    
    init(id: String, name: String, price: Int, quantity: Int) {
        self.id = id
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}
