//
//  CoreDataStoreProtocol.swift
//  CleanBuddyCoffee
//
//  Created by Uy Cung Dinh on 8/26/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol CoreDataStoreProtocol {
    func createOrder(orderId: String, email: String, name: String, date: Date, address: String)
    func fetchOrder() -> [Order]?
}
