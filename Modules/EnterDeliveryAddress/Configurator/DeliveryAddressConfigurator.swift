//
//  DeliveryAddressDeliveryAddressConfigurator.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 20/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class DeliveryAddressModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, cartItems: [Cart.Item]) {

        if let viewController = viewInput as? DeliveryAddressViewController {
            configure(viewController: viewController, cartItems: cartItems)
        }
    }

    private func configure(viewController: DeliveryAddressViewController, cartItems: [Cart.Item]) {

        let router = DeliveryAddressRouter()
        router.sourceView = viewController

        let presenter = DeliveryAddressPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DeliveryAddressInteractor()
        interactor.output = presenter
        let localService: DeliveryAddressModuleLocalService & GetCartItemsLocalService = CartLocalService()
        interactor.localService = localService
        let networkService = OrderingNetworkService()
        interactor.networkService = networkService
        interactor.cartItems = cartItems

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
