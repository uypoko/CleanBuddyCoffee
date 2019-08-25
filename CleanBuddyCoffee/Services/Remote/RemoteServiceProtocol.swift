//
//  FirebaseProtocols.swift
//  CleanBuddyCoffee
//
//  Created by Uy Cung Dinh on 8/18/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol RemoteServiceProtocol {
    func fetchDrinks(completion: @escaping ([ListDrinks.Drink]?) -> Void)
    func fetchDrinkImage(drinkName: String, completion: @escaping (Data?) -> Void)
    func fetchDrink(for id: String, completion: @escaping (DrinkDetail.Drink?) -> Void)
    func fetchDrinkDetailImage(drinkId: String, completion: @escaping (Data?) -> Void)
    func placeOrder(customer: DeliveryAddressModel.Customer, items: [CartItem], completion: @escaping (Error?) -> Void)
}
