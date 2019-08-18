//
//  ListDrinksListDrinksViewController.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class ListDrinksViewController: UITableViewController {

    var output: ListDrinksViewOutput!
    private var drinks: [ListDrinks.DrinkViewModel] = []
    private var imageDictionary: [String: IndexPath] = [:]

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: Tableview data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as! DrinkTableViewCell
        let drink = drinks[indexPath.row]
        cell.updateUI(withDrink: drink)
        imageDictionary[drink.name] = indexPath
        output.drinkCellDequeued(drinkName: drink.name)
        return cell
    }
    
    // MARK: Tableview delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ListDrinksViewController: ListDrinksViewInput {
    
    func displayProducts(with products: [ListDrinks.DrinkViewModel]) {
        self.drinks = products
        tableView.reloadData()
    }
    
    func displayDrinkImage(for drinkName: String, data: Data) {
        guard let indexPath = imageDictionary[drinkName] else { return }
        let cell = tableView.cellForRow(at: indexPath) as? DrinkTableViewCell
        cell?.setImage(data: data)
    }
    
}
