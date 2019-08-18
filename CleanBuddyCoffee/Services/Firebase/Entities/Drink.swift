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
        let name: String
        let price: Int
        
        static func ==(lhs: Drink, rhs: Drink) -> Bool {
            return lhs.id == rhs.id
        }
    }
    
}

extension DrinkDetail {
    
    struct Drink {
        let id: String
        let name: String
        let description: String
        let price: Int
    }
    
}
