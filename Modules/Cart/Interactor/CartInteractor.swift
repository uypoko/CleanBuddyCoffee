//
//  CartCartInteractor.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class CartInteractor: CartInteractorInput {

    weak var output: CartInteractorOutput!
    var remoteService: RemoteServiceProtocol?
    var localService: LocalServiceProtocol!
    
    func getCartItems() {
        let cartItems = localService.getCartItems()
        output.didFetchCartItems(items: cartItems)
    }
    
    func deleteItem(id: String) {
        localService.removeItem(drinkId: id)
        output.didDeleteItem(id: id)
    }
    
    func changeItemQuantity(itemId: String, quantity: Int) {
        localService.changeItemQuantity(drinkId: itemId, quantity: quantity)
        output.didChangeItemQuantity(itemId: itemId, quantity: quantity)
    }
    
}
