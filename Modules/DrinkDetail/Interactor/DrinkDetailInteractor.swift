//
//  DrinkDetailDrinkDetailInteractor.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class DrinkDetailInteractor: DrinkDetailInteractorInput {

    weak var output: DrinkDetailInteractorOutput!
    var service: DrinkDetailService?
    
    func fetchDrink(drinkId: String) {
        service?.fetchDrink(for: drinkId) { [weak self] drink in
            if let drink = drink {
                self?.output.didFetchDrink(drink: drink)
            }
        }
    }
    
    func fetchDrinkImage(drinkId: String) {
        service?.fetchDrinkDetailImage(drinkId: drinkId) { [weak self] data in
            if let data = data {
                self?.output.didFetchDrinkImage(data: data)
            }
        }
    }
    
}
