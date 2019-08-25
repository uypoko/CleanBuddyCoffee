//
//  DrinkDetailDrinkDetailInteractor.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class DrinkDetailInteractor: DrinkDetailInteractorInput {

    weak var output: DrinkDetailInteractorOutput!
    var localService: LocalServiceProtocol!
    var remoteService: RemoteServiceProtocol?
    
    func fetchDrink(drinkId: String) {
        remoteService?.fetchDrink(for: drinkId) { [weak self] drink in
            if let drink = drink {
                self?.output.didFetchDrink(drink: drink)
            }
        }
    }
    
    func fetchDrinkImage(drinkId: String) {
        remoteService?.fetchDrinkDetailImage(drinkId: drinkId) { [weak self] data in
            if let data = data {
                self?.output.didFetchDrinkImage(data: data)
            }
        }
    }
    
    func addToCart(drinkId: String, quantity: Int) {
        if localService.isItemInCart(id: drinkId) {
            localService.addExistingItem(drinkId: drinkId, quantity: quantity)
        } else {
            remoteService?.fetchDrink(for: drinkId) { [weak self] drink in
                guard let drink = drink else { return }
                let item = CartItem(id: drink.id, name: drink.name, price: drink.price, quantity: quantity)
                self?.localService.addNewItem(item: item)
            }
        }
    }
    
}
