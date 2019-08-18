//
//  DrinkDetailDrinkDetailPresenter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//
import Foundation

class DrinkDetailPresenter: DrinkDetailModuleInput, DrinkDetailViewOutput {

    weak var view: DrinkDetailViewInput!
    var interactor: DrinkDetailInteractorInput!
    var router: DrinkDetailRouterInput!

    func viewIsReady() {

    }
}

extension DrinkDetailPresenter: DrinkDetailInteractorOutput {
    
    func didFetchDrink(drink: DrinkDetail.Drink) {
        let price = "\(drink.price) đ"
        let viewModel = DrinkDetail.DrinkViewModel(id: drink.id, name: drink.name, description: drink.description, price: price)
        view.displayDrink(drink: viewModel)
    }
    
    func didFetchDrinkImage(data: Data) {
        view.displayDrinkImage(data: data)
    }
    
}
