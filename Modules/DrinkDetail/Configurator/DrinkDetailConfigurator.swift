//
//  DrinkDetailDrinkDetailConfigurator.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class DrinkDetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, drinkId: String) {

        if let viewController = viewInput as? DrinkDetailViewController {
            configure(viewController: viewController, drinkId: drinkId)
        }
    }

    private func configure(viewController: DrinkDetailViewController, drinkId: String) {
        viewController.drinkId = drinkId
        let router = DrinkDetailRouter()

        let presenter = DrinkDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DrinkDetailInteractor()
        interactor.output = presenter
        let service: DrinkDetailService = MenuNetworkService()
        interactor.networkService = service
        let cartService: DrinkDetailModuleCodableCartService =  CartLocalService()
        interactor.cartService =  cartService
        
        presenter.interactor = interactor
        viewController.output = presenter
    }

}
