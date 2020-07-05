//
//  ViewController.swift
//  artbrush
//
//  Created by Tony Dam on 05/07/2020.
//  Copyright © 2020 TonyDam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
        
    }

}

