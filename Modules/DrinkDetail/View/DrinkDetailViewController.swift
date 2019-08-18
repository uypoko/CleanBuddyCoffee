//
//  DrinkDetailDrinkDetailViewController.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class DrinkDetailViewController: UIViewController {

    var output: DrinkDetailViewOutput!

    // MARK: IBOutlets
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

}

extension DrinkDetailViewController: DrinkDetailViewInput {
    
    func displayDrink(drink: DrinkDetail.DrinkViewModel) {
        DispatchQueue.main.async {
            self.nameLabel.text = drink.name
            self.descriptionLabel.text = drink.description
            self.priceLabel.text = drink.price
        }
    }
    
    func displayDrinkImage(data: Data) {
        DispatchQueue.main.async {
            self.drinkImageView.image = UIImage(data: data)
        }
    }
    
}
