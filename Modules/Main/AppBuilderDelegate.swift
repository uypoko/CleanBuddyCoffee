//
//  AppBuilderDelegate.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/26/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol AppBuilderDelegate {
    func configureDrinkDetailModule(drinkId: String) -> DrinkDetailViewController
    func configureEnterDeliveryAddressModule() -> DeliveryAddressViewController
    func configureSetAddressOnMapModule() -> SetAddressOnMapViewController
}
