//
//  DeliveryAddressDeliveryAddressInteractorOutput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 20/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol DeliveryAddressInteractorOutput: class {
    func didPlaceOrder()
    func failedPlaceOrder(error: Error)
}
