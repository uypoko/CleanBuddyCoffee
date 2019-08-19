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
    var items: [Cart.ItemViewModel] = []
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewIsReady()
    }

    // MARK Tableview data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as! CartItemCell
        let item = items[indexPath.row]
        cell.updateUI(item: item)
        return cell
    }

}

extension CartViewController: CartViewInput {
    func displayCartItems(items: [Cart.ItemViewModel]) {
        self.items = items
        tableView.reloadData()
    }
}
