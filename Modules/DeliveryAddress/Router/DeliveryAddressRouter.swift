//
//  DeliveryAddressDeliveryAddressRouter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 20/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class DeliveryAddressRouter: DeliveryAddressRouterInput {
    
    weak var sourceView: DeliveryAddressViewController!
    
    func routeToCartView() {
        sourceView.navigationController?.popViewController(animated: true)
    }
}
