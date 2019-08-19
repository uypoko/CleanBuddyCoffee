//
//  DrinkDetailDrinkDetailInteractor.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class DrinkDetailInteractor: DrinkDetailInteractorInput {

    weak var output: DrinkDetailInteractorOutput!
    var networkService: DrinkDetailService?
    var cartService: DrinkDetailModuleCodableCartService?
    
    func fetchDrink(drinkId: String) {
        networkService?.fetchDrink(for: drinkId) { [weak self] drink in
            if let drink = drink {
                self?.output.didFetchDrink(drink: drink)
            }
        }
    }
    
    func fetchDrinkImage(drinkId: String) {
        networkService?.fetchDrinkDetailImage(drinkId: drinkId) { [weak self] data in
            if let data = data {
                self?.output.didFetchDrinkImage(data: data)
            }
        }
    }
    
    func addToCart(drinkId: String, quantity: Int) {
        cartService?.addItem(drinkId: drinkId, quantity: quantity)
    }
    
}
