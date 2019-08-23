//
//  CartCartRouter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class CartRouter: CartRouterInput {
    weak var sourceView: CartViewController!
    
    func routeToDeliveryAddress(cartItems: [Cart.Item]) {
        let destination = DeliveryAddressViewController.instantiate(fromAppStoryboard: .DeliveryAddress)
        DeliveryAddressModuleConfigurator().configureModuleForViewInput(viewInput: destination, cartItems: cartItems)
        sourceView.navigationController?.pushViewController(destination, animated: true)
    }
}
