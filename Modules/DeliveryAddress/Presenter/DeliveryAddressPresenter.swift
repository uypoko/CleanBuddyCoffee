//
//  DeliveryAddressDeliveryAddressPresenter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 20/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class DeliveryAddressPresenter: DeliveryAddressViewOutput {

    weak var view: DeliveryAddressViewInput!
    var interactor: DeliveryAddressInteractorInput!
    var router: DeliveryAddressRouterInput!

    func viewIsReady() {

    }
    
    func placeOrder(email: String, name: String, phone: String, address: String) {
        interactor.placeOrder(email: email, name: name, phone: phone, address: address)
    }
}

extension DeliveryAddressPresenter: DeliveryAddressInteractorOutput {
    func didPlaceOrder() {
        view.didPlaceOrder()
    }
    
    func failedPlaceOrder(error: Error) {
        view.failedPlaceOrder(error: error)
    }
}
