//
//  CartCartPresenter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class CartPresenter: CartModuleInput, CartViewOutput {

    weak var view: CartViewInput!
    var interactor: CartInteractorInput!
    var router: CartRouterInput!

    func viewIsReady() {
        interactor.getCartItems()
    }
}

extension CartPresenter: CartInteractorOutput {
    func didFetchCartItems(items: [Cart.Item]) {
        var viewModels: [Cart.ItemViewModel] = []
        for item in items {
            let quantity = "\(item.quatity)"
            let price = "\(item.price) đ"
            let viewModel = Cart.ItemViewModel(id: item.id, name: item.name, quatity: quantity, price: price)
            viewModels.append(viewModel)
        }
        view.displayCartItems(items: viewModels)
    }
    
}
