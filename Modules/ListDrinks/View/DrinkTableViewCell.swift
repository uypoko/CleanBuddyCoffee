//
//  DrinkTableViewCell.swift
//  BuddyCoffee
//
//  Created by Ryan on 7/3/19.
//  Copyright © 2019 Equity. All rights reserved.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {

    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(withDrink drink: Drink) {
        drinkNameLabel.text = drink.name
        priceLabel.text = "\(drink.price) đ"
    }
    
}
