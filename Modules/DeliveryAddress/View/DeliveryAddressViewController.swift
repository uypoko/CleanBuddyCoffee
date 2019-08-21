//
//  DeliveryAddressDeliveryAddressViewController.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 20/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class DeliveryAddressViewController: UIViewController {

    var output: DeliveryAddressViewOutput!

    // MARK: IBOutlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var addressTextView: AddressTextView!
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setupInitialState()
    }

    // MARK: DeliveryAddressViewInput
    func setupInitialState() {
        addressTextView.configure()
        activityIndicator.isHidden = true
    }
    
    // MARK: IBActions
    @IBAction func placeOrderButtonTapped(_ sender: Any) {
        do {
            let email = try emailField.validatedText(validationType: .email)
            let name = try nameField.validatedText(validationType: .requiredField(field: "Name"))
            let phone = try phoneNumberField.validatedText(validationType: .phone)
            let address = try addressTextView.validatedText(validationType: .requiredField(field: "Address"))
            
            let alert = UIAlertController(title: "Confirm Order", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Submit", style: .default) { _ in
                self.activityIndicator.isHidden = false
                self.activityIndicator.startAnimating()
                self.output.placeOrder(email: email, name: name, phone: phone, address: address)
            })
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        } catch (let error) {
            showAlert(message: (error as! ValidationError).message, completion: nil)
        }
    }
    
}

extension DeliveryAddressViewController: DeliveryAddressViewInput {
    func didPlaceOrder() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        showAlert(message: "Place order successfully!", completion: nil)
    }
    
    func failedPlaceOrder(error: Error) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        showAlert(message: error.localizedDescription, completion: nil)
    }
}
