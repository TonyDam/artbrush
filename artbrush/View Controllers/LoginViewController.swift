//
//  LoginViewController.swift
//  artbrush
//
//  Created by Tony Dam on 05/07/2020.
//  Copyright © 2020 TonyDam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Mark: Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    // Mark: Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

    }
    
    // Mark: Functions
    func setUpElements() {
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        
    }
    

    // Mark: Actions
    @IBAction func loginTapped(_ sender: Any) {
    }
    
}
