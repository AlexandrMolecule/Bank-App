//
//  LoginView.swift
//  Bank App
//
//  Created by Alexandr Gerasimov on 08.04.2022.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let stackView = UIStackView()
    let usernameTxtField = UITextField()
    let passwordTxtField = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginView {
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        
        configurateTxtField(txtField: usernameTxtField, placeholder: "Username")
        configurateTxtField(txtField: passwordTxtField, placeholder: "Password")
        passwordTxtField.isSecureTextEntry = true
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func layout(){
        
        stackView.addArrangedSubview(usernameTxtField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTxtField)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
            
        ])
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func configurateTxtField(txtField: UITextField, placeholder: String? = nil){
        txtField.translatesAutoresizingMaskIntoConstraints = false
        if(placeholder != nil){
            txtField.placeholder = placeholder
        }
        txtField.delegate = self
    }
}


