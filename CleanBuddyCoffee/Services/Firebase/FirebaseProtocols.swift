//
//  FirebaseProtocols.swift
//  CleanBuddyCoffee
//
//  Created by Uy Cung Dinh on 8/18/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol ListDrinksService {
    
    func fetchDrinks(completion: @escaping ([ListDrinks.Drink]?) -> Void)
    func fetchDrinkImage(drinkName: String, completion: @escaping (Data?) -> Void)
    
}

protocol DrinkDetailService {
    
    func fetchDrink(for id: String, completion: @escaping (DrinkDetail.Drink?) -> Void)
    func fetchDrinkDetailImage(drinkId: String, completion: @escaping (Data?) -> Void)
    
}

protocol CartNetworkService {
    func fetchDrinks(drinkIds: [String], completion: @escaping ([Cart.FetchedItem]?) -> Void)
}
