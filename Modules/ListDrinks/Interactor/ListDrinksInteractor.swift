//
//  ListDrinksListDrinksInteractor.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class ListDrinksInteractor: ListDrinksInteractorInput {

    weak var output: ListDrinksInteractorOutput!
    var service: ListDrinksService?

    func fetchDrinks() {
        service?.fetchDrinks { [weak self] drinks in
            if let drinks = drinks {
                self?.output.didFetchDrinks(drinks: drinks)
            }
        }
    }
    
    func fetchImage(drinkName: String) {
        service?.fetchDrinkImage(drinkName: drinkName) { [weak self] data in
            if let data = data {
                self?.output.didFetchImage(for: drinkName, data: data)
            }
        }
    }
    
}
