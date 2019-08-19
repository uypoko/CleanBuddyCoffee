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
    var codableService: CartModuleCodableService!
    
    func getCartItems() {
        var ids: [String] = []
        let cartItems = codableService.getItems()
        for item in cartItems {
            ids.append(item.id)
        }
        networkService?.fetchDrinks(drinkIds: ids) { fetchedItems in
            guard let fetchedItems = fetchedItems else { return }
            var items: [Cart.Item] = []
            for fetchedItem in fetchedItems {
                let quantity = cartItems.first(where: {$0.id == fetchedItem.id})!.quantity
                let item = Cart.Item(id: fetchedItem.id, name: fetchedItem.name, quatity: quantity, price: fetchedItem.price)
                items.append(item)
            }
            self.output.didFetchCartItems(items: items)
        }
    }
    
}
