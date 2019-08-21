//
//  CartItemCell.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/19/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class CartItemCell: UITableViewCell {
    
    var itemId: String?
    var delegate: ChangeItemQuantityDelegate?

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
        itemId = item.id
        nameLabel.text = item.name
        quantityLabel.text = "\(item.quantity)"
        priceLabel.text = "\(item.price) đ"
        stepper.value = Double(item.quantity)
    }

    @IBAction func stepperValueChanged(_ sender: Any) {
        let quantity = Int(stepper.value)
        if quantity == 0 {
            stepper.value = 1
            return
        }
        quantityLabel.text = "\(quantity)"
        delegate?.changeItemQuantity(itemId: itemId!, quantity: quantity)
    }
    
}

protocol ChangeItemQuantityDelegate {
    func changeItemQuantity(itemId: String, quantity: Int)
}
