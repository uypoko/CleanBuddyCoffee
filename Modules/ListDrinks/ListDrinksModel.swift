//
//  ListDrinksModel.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/15/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

enum ListDrinks {
    
    struct Drink: Equatable {
        let id: String
        let name: String
        let price: Int
        
        static func ==(lhs: Drink, rhs: Drink) -> Bool {
            return lhs.id == rhs.id
        }
    }
    
    struct DrinkViewModel {
        let id: String
        let name: String
        let price: String
    }
    
    struct DrinkImageViewModel {
        let name: String
        let data: Data
    }
    
}
