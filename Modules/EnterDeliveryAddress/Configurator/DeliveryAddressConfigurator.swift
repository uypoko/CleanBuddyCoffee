//
//  DeliveryAddressDeliveryAddressConfigurator.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 20/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class DeliveryAddressModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DeliveryAddressViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DeliveryAddressViewController) {

        let router = DeliveryAddressRouter()
        router.sourceView = viewController

        let presenter = DeliveryAddressPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DeliveryAddressInteractor()
        interactor.output = presenter
        let localService = LocalService()
        interactor.localService = localService
        let remoteService = RemoteService()
        interactor.remoteService = remoteService

        presenter.interactor = interactor
        viewController.output = presenter
    }

}