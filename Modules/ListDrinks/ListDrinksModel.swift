//
//  ListDrinksModel.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/15/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

enum ListDrinks {
    
    struct Drink {
        let id: String
        let name: String
        let price: Int
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
