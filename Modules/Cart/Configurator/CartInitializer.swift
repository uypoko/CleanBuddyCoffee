//
//  CartCartInitializer.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class CartModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var cartViewController: CartViewController!

    override func awakeFromNib() {

        let configurator = CartModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: cartViewController)
    }

}
