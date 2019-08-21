//
//  UIViewController+Extensions.swift
//  CleanBuddyCoffee
//
//  Created by Uy Cung Dinh on 8/21/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit.UIViewController

extension UIViewController {
    func showAlert(message: String, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: completion))
        present(alert, animated: true, completion: nil)
    }
}
