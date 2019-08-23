//
//  DeliveryAddressDeliveryAddressInteractor.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 20/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class DeliveryAddressInteractor: DeliveryAddressInteractorInput {

    weak var output: DeliveryAddressInteractorOutput!
    var localService: (DeliveryAddressModuleLocalService & GetCartItemsLocalService)!
    var networkService: DeliveryAddressModuleNetworkService?
    var cartItems: [Cart.Item] = []
    
    func placeOrder(email: String, name: String, phone: String, address: String) {
        let customer = DeliveryAddressModel.Customer(email: email, name: name, phone: phone, address: address)
        
        //let items = localService.getCartItems()
        networkService?.placeOrder(customer: customer, items: cartItems) { [unowned self] error in
            if let error = error {
                self.output.failedPlaceOrder(error: error)
            } else {
                self.output.didPlaceOrder()
                self.localService.removeCartItems()
            }
        }
    }
}
