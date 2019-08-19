//
//  CartItemCell.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/19/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class CartItemCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(item: Cart.ItemViewModel) {
        nameLabel.text = item.name
        quantityLabel.text = item.quatity
        priceLabel.text = item.price
    }

    @IBAction func stepperValueChanged(_ sender: Any) {
    }
    
}
