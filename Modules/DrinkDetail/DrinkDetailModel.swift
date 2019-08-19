//
//  DrinkDetailViewModel.swift
//  CleanBuddyCoffee
//
//  Created by Uy Cung Dinh on 8/18/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

enum DrinkDetail {
    
    struct Drink {
        let id: String
        let name: String
        let description: String
        let price: Int
    }
    
    struct DrinkViewModel {
        let id: String
        let name: String
        let description: String
        let price: String
    }
    
}
