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
