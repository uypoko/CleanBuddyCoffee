//
//  ListDrinksListDrinksInitializer.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class ListDrinksModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var listdrinksViewController: ListDrinksViewController!

    override func awakeFromNib() {

        let configurator = ListDrinksModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: listdrinksViewController)
    }

}
