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
    
    func placeOrderButtonTapped(email: String, name: String, phone: String, address: String) {
        interactor.placeOrder(email: email, name: name, phone: phone, address: address)
    }
    
    func didShowOrderSuccessMessage() {
        router.routeToCartView()
    }
    
    func setAddressOnMapButtonTapped() {
        router.routeToMapView()
    }
}

extension DeliveryAddressPresenter: DeliveryAddressInteractorOutput {
    func didPlaceOrder() {
        view.displaySuccessOrderMessage()
    }
    
    func failedPlaceOrder(error: Error) {
        view.displayErrorOrderMessage(error: error)
    }
}
