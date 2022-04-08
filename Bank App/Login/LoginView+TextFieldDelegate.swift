//
//  LoginView+TextFieldDelegate.swift
//  Bank App
//
//  Created by Alexandr Gerasimov on 08.04.2022.
//

import Foundation
import UIKit

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTxtField.endEditing(true)
        passwordTxtField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}
