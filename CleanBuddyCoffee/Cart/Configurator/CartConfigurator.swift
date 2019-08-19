//
//  CartCartConfigurator.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class CartModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CartViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CartViewController) {

        let router = CartRouter()

        let presenter = CartPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CartInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
