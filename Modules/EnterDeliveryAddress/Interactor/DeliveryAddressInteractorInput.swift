//
//  DeliveryAddressDeliveryAddressInteractorInput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 20/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol DeliveryAddressInteractorInput {
    func placeOrder(email: String, name: String, phone: String, address: String)
}
