//
//  CartModel.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/19/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

enum Cart {
    
    struct FetchedItem {
        let id: String
        var name: String
        var price: Int
    }
    
    struct ItemViewModel {
        let id: String
        var name: String
        var quantity: Int
        var price: Int
    }
}
