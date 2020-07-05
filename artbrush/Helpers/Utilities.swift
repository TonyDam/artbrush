//
//  Utilities.swift
//  artbrush
//
//  Created by Tony Dam on 05/07/2020.
//  Copyright © 2020 TonyDam. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.orange.cgColor
        
        textfield.borderStyle = .none
        
        textfield.layer.addSublayer(bottomLine)
        
        textfield.tintColor = UIColor.white
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.orange
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}
