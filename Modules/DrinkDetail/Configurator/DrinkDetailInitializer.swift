//
//  DrinkDetailDrinkDetailInitializer.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class DrinkDetailModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var drinkdetailViewController: DrinkDetailViewController!

    override func awakeFromNib() {

        let configurator = DrinkDetailModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: drinkdetailViewController, drinkId: "")
    }

}
