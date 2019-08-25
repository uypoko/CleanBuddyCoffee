//
//  CartCartViewController.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class CartViewController: UITableViewController {

    var output: CartViewOutput!
    var items: [CartItem] = []
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        let confirmButton = UIBarButtonItem(title: "Confirm", style: .plain, target: self, action: #selector(confirmButtonTapped))
        navigationItem.rightBarButtonItem = confirmButton
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }
    
    // MARK: IBActions
    @IBAction func confirmButtonTapped(sender: UIBarButtonItem) {
        guard !items.isEmpty else { return }
        output.confirmCartButtonTaped()
    }
    
    // MARK: View setups
    func updatePriceTitle() {
        let total = items.reduce(0) { (result, item) -> Int in
            return result + (item.price * item.quantity)
        }
        navigationItem.title = "\(total) đ"
    }

    // MARK: Tableview data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as! CartItemCell
        let item = items[indexPath.row]
        cell.updateUI(item: item)
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = items[indexPath.row]
            output.deleteItemButtonTapped(id: item.id)
        }
    }
    
    // MARK: Tableview delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension CartViewController: CartViewInput {
    func displayCartItems(items: [CartItem]) {
        self.items = items
        updatePriceTitle()
        tableView.reloadData()
    }
    
    func didDeleteItem(id: String) {
        guard let index = items.firstIndex(where: {$0.id == id}) else { return }
        items.remove(at: index)
        updatePriceTitle()
        tableView.reloadData()
    }
    
    func didChangeItemQuantity(itemId: String, quantity: Int) {
        guard let index = items.firstIndex(where: {$0.id == itemId}) else { return }
        items[index].quantity = quantity
        updatePriceTitle()
        tableView.reloadData()
    }
}

extension CartViewController: ChangeItemQuantityDelegate {
    func changeItemQuantity(itemId: String, quantity: Int) {
        output.changeItemQuantityButtonTapped(itemId: itemId, quantity: quantity)
    }
}
