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
    var quantity: Int
    
    init(id: String, quantity: Int) {
        self.id = id
        self.quantity = quantity
    }
}
