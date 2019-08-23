//
//  CartCartInteractor.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class CartInteractor: CartInteractorInput {

    weak var output: CartInteractorOutput!
    var networkService: CartNetworkService?
    var localService: (GetCartItemsLocalService & CartModuleLocalService)!
    var cartItems: [Cart.Item] = []
    
    func getPreviousCartItems() {
        let previousCartItems = localService.getCartItems()
        if previousCartItems.isEmpty {
            output.didFetchCartItems(items: [])
            return
        }
        
        var ids: [String] = []
        for item in previousCartItems {
            ids.append(item.id)
        }
        networkService?.fetchDrinks(drinkIds: ids) { [weak self] fetchedItems in
            guard let fetchedItems = fetchedItems else { return }
            for fetchedItem in fetchedItems {
                let quantity = previousCartItems.first(where: {$0.id == fetchedItem.id})!.quantity
                let item = Cart.Item(id: fetchedItem.id, name: fetchedItem.name, quantity: quantity, price: fetchedItem.price)
                self?.cartItems.append(item)
            }
            self?.output.didFetchCartItems(items: self!.cartItems)
        }
    }
    
    func deleteItem(id: String) {
        localService.removeItem(drinkId: id)
        guard let index = cartItems.firstIndex(where: {$0.id == id}) else { return }
        cartItems.remove(at: index)
        output.didDeleteItem(id: id)
    }
    
    func changeItemQuantity(itemId: String, quantity: Int) {
        localService.changeItemQuantity(drinkId: itemId, quantity: quantity)
        guard let index = cartItems.firstIndex(where: {$0.id == itemId}) else { return }
        cartItems[index].quantity = quantity
        output.didChangeItemQuantity(itemId: itemId, quantity: quantity)
    }
    
    func getFinalCartItems() -> [Cart.Item] {
        return cartItems
    }
}
