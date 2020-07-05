//
//  SignUpViewController.swift
//  artbrush
//
//  Created by Tony Dam on 05/07/2020.
//  Copyright © 2020 TonyDam. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    
    
    // Mark: Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    // Mark: Properties
   override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    
    
    // Mark: Functions
    func setUpElements() {
        errorLabel.alpha = 0
    
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    func validateFields() -> String? {
        if usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Veuillez remplir tous les champs."
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Votre mot de passe doit faire au moins 6 caractères, contenant 1 special caractère et un nombre."
        }
        return nil
    }
    
    

    // Mark: Actions
    @IBAction func signUpTapped(_ sender: Any) {
            
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        } else {
            
            let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            

            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showError("Error creating user")
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["username":username, "uid": result!.user.uid ]) { (error) in
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                    }
                    self.transitionToHome()
                }
            }
        }
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
