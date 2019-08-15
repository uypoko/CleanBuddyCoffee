//
//  ListDrinksListDrinksViewController.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class ListDrinksViewController: UITableViewController, ListDrinksViewInput {

    var output: ListDrinksViewOutput!
    var products: [ListDrinks.ProductViewModel] = []

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: ListDrinksViewInput
    func setupInitialState() {
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "charCell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.name
        return cell
    }
    
    func displayProducts(with products: [ListDrinks.ProductViewModel]) {
        self.products = products
        tableView.reloadData()
    }
    
}
