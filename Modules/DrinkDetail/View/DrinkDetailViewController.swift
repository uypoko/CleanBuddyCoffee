//
//  DrinkDetailDrinkDetailViewController.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class DrinkDetailViewController: UIViewController {

    var presenter: DrinkDetailViewOutput!
    var drinkId: String?

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
        nameLabel.text = ""
        descriptionLabel.text = ""
        priceLabel.text = ""
        if let drinkId = drinkId {
            presenter.viewIsReady(drinkId: drinkId)
        }
    }

    // MARK: IBACtions
    @IBAction func stepperValueChanged(_ sender: Any) {
        let quantity = Int(stepper.value)
        quantityLabel.text = "\(quantity)"
    }
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
        let quantity = Int(stepper.value)
        guard let drinkId = drinkId, quantity > 0 else { return }
        UIView.animate(withDuration: 0.25) {
            sender.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        presenter.addToCartButtonTapped(drinkId: drinkId, quantity: quantity)
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
