//
//  CartCartViewController.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, CartViewInput {

    var output: CartViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: CartViewInput
    func setupInitialState() {
    }
}
