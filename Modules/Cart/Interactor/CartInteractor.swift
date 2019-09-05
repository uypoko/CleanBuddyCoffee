//
//  CartCartInteractor.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class CartInteractor: CartInteractorInput {

    weak var presenter: CartInteractorOutput!
    var remoteService: RemoteServiceProtocol?
    var localService: LocalServiceProtocol!
    
    func getCartItems() {
        let cartItems = localService.getCartItems()
        presenter.didFetchCartItems(items: cartItems)
    }
    
    func deleteItem(id: String) {
        localService.removeItem(drinkId: id)
        presenter.didDeleteItem(id: id)
    }
    
    func changeItemQuantity(itemId: String, quantity: Int) {
        localService.changeItemQuantity(drinkId: itemId, quantity: quantity)
        presenter.didChangeItemQuantity(itemId: itemId, quantity: quantity)
    }
    
}
