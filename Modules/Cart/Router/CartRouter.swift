//
//  CartCartRouter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class CartRouter: CartRouterInput {
    weak var sourceView: CartViewController!
    
    func routeToDeliveryAddress() {
        let destination = DeliveryAddressViewController.instantiate(fromAppStoryboard: .DeliveryAddress)
        DeliveryAddressModuleConfigurator().configureModuleForViewInput(viewInput: destination)
        sourceView.navigationController?.pushViewController(destination, animated: true)
    }
}
