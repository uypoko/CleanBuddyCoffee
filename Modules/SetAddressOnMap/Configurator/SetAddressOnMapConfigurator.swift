//
//  SetAddressOnMapSetAddressOnMapConfigurator.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 22/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class SetAddressOnMapModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SetAddressOnMapViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SetAddressOnMapViewController) {

        let router = SetAddressOnMapRouter()

        let presenter = SetAddressOnMapPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SetAddressOnMapInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
