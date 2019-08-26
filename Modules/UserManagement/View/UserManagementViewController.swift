//
//  UserManagementViewController.swift
//  CleanBuddyCoffee
//
//  Created by Uy Cung Dinh on 8/26/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class UserManagementViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var addressTextView: AddressTextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var signInSignOutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: IBActions
    @IBAction func changeProfilePictureButtonTapped(_ sender: Any) {
    }
    
    @IBAction func submitChangeButtonTapped(_ sender: Any) {
    }
    
    @IBAction func updatePasswordButtonTapped(_ sender: Any) {
    }
    
    @IBAction func viewOrderHistoryButtonTapped(_ sender: Any) {
    }
    
    @IBAction func signInSignOutButtonTapped(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
