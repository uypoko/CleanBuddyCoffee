//
//  CartCartRouter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class CartRouter: CartRouterInput {
    weak var sourceView: CartViewController!
    var appBuilderDelegate: AppBuilderDelegate!
    
    func routeToDeliveryAddress() {
        let destinationView = appBuilderDelegate.configureEnterDeliveryAddressModule()
        sourceView.navigationController?.pushViewController(destinationView, animated: true)
    }
}
