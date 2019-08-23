//
//  OrderingNetworkProtocols.swift
//  CleanBuddyCoffee
//
//  Created by Uy Cung Dinh on 8/21/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol DeliveryAddressModuleNetworkService {
    func placeOrder(customer: DeliveryAddressModel.Customer, items: [Cart.Item], completion: @escaping (Error?) -> Void)
}
