//
//  ListDrinksListDrinksViewOutput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//
import Foundation

protocol ListDrinksViewOutput {

    /**
        @author Ryan
        Notify presenter that view is ready
    */

    func viewIsReady()
    func drinkCellDequeued(drinkName: String)
    func didSelectRow(drinkId: String)
    
}
