//
//  Drink.swift
//  BuddyCoffee
//
//  Created by Uy Cung Dinh on 7/3/19.
//  Copyright © 2019 Equity. All rights reserved.
//

import Foundation

extension ListDrinks {
    
    struct Drink: Equatable {
        let id: String
        var name: String
        var price: Int
        
        static func ==(lhs: Drink, rhs: Drink) -> Bool {
            return lhs.id == rhs.id
        }
    }
    
}


