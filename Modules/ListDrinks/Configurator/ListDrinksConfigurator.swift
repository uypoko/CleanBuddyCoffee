//
//  ListDrinksListDrinksConfigurator.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class ListDrinksModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ListDrinksViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ListDrinksViewController) {

        let router = ListDrinksRouter()
        router.sourceView = viewController

        let presenter = ListDrinksPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ListDrinksInteractor()
        interactor.output = presenter
        let service: ListDrinksService = DrinkService()
        interactor.service = service

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
