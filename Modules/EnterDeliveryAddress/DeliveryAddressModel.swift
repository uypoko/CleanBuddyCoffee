//
//  DeliveryAddressModel.swift
//  CleanBuddyCoffee
//
//  Created by Uy Cung Dinh on 8/21/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

enum DeliveryAddressModel {
    
    struct CartItem {
        let name: String
        let price: Int
        let quantity: Int
    }
    
    struct Customer {
        let email: String
        let name: String
        let phone: String
        let address: String
    }
    
}
