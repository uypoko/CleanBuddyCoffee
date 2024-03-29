//
//  CartCartPresenter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class CartPresenter: CartViewOutput {

    weak var view: CartViewInput!
    var interactor: CartInteractorInput!
    var router: CartRouterInput!

    func viewWillAppear() {
        interactor.getCartItems()
    }
    
    func deleteItemButtonTapped(id: String) {
        interactor.deleteItem(id: id)
    }
    
    func changeItemQuantityButtonTapped(itemId: String, quantity: Int) {
        interactor.changeItemQuantity(itemId: itemId, quantity: quantity)
    }
    
    func confirmCartButtonTaped() {
        router.routeToDeliveryAddress()
    }
}

extension CartPresenter: CartInteractorOutput {
    func didFetchCartItems(items: [CartItem]) {
        view.displayCartItems(items: items)
    }
    
    func didDeleteItem(id: String) {
        view.didDeleteItem(id: id)
    }
    
    func didChangeItemQuantity(itemId: String, quantity: Int) {
        view.didChangeItemQuantity(itemId: itemId, quantity: quantity)
    }
}
