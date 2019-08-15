//
//  ListDrinksListDrinksPresenter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class ListDrinksPresenter: ListDrinksModuleInput, ListDrinksViewOutput, ListDrinksInteractorOutput {

    weak var view: ListDrinksViewInput!
    var interactor: ListDrinksInteractorInput!
    var router: ListDrinksRouterInput!
    var products: [Product]?
    
    func viewIsReady() {
        interactor.fetchProducts()
    }
    
    func didFetchDrinks(products: [Product]) {
        view.displayProducts(with: products)
    }
}
