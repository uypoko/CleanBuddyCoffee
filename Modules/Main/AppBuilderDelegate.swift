//
//  AppBuilderDelegate.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/26/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

protocol AppBuilderDelegate {
    func configureDrinkDetailModule(drinkId: String) -> UIViewController
    func configureEnterDeliveryAddressModule() -> UIViewController
    func configureSetAddressOnMapModule() -> UIViewController
}
