//
//  Drink.swift
//  BuddyCoffee
//
//  Created by Uy Cung Dinh on 7/3/19.
//  Copyright © 2019 Equity. All rights reserved.
//

import Foundation

struct Drink: Equatable {
    let id: String
    var name: String
    var category: String
    var price: Int
    var description: String
    var imageData: Data?
    
    static func ==(lhs: Drink, rhs: Drink) -> Bool {
        return lhs.id == rhs.id
    }
}
