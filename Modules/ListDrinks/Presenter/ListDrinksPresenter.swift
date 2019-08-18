//
//  ListDrinksListDrinksPresenter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//
import Foundation

class ListDrinksPresenter: ListDrinksModuleInput {

    weak var view: ListDrinksViewInput!
    var interactor: ListDrinksInteractorInput!
    var router: ListDrinksRouterInput!
}

extension ListDrinksPresenter: ListDrinksViewOutput {
    
    func viewIsReady() {
        interactor.fetchDrinks()
    }
    
    func drinkCellDequeued(drinkName: String) {
        interactor.fetchImage(drinkName: drinkName)
    }
    
}

extension ListDrinksPresenter: ListDrinksInteractorOutput {
    
    func didFetchDrinks(drinks: [ListDrinks.Drink]) {
        var viewModels: [ListDrinks.DrinkViewModel] = []
        for rawDrink in drinks {
            let drink = ListDrinks.DrinkViewModel(name: rawDrink.name, price: "\(rawDrink.price)")
            viewModels.append(drink)
        }
        view.displayProducts(with: viewModels)
    }
    
    func didFetchImage(for drinkName: String, data: Data) {
        view.displayDrinkImage(for: drinkName, data: data)
    }
    
}
