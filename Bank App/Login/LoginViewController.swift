//
//  ViewController.swift
//  Bank App
//
//  Created by Alexandr Gerasimov on 08.04.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    private var username: String? {
        return loginView.usernameTxtField.text
    }
    private var password: String? {
        return loginView.passwordTxtField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
}

extension LoginViewController{
    private func style(){
        print(loginView.translatesAutoresizingMaskIntoConstraints)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.text = ""
        errorMessageLabel.isHidden = true
        
    }
    
    private func layout(){
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //Login View constraints
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        // SingIn button constraints
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // Error Constraints
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
    
    
}

extension LoginViewController{
    @objc func signInTapped(){
        login()
    }
    
    private func login(){
        guard let username = username, let password = password else{
            assertionFailure("cant be nil")
            return
        }
        if( password.isEmpty || username.isEmpty ){
            showError(withMessage: "Username/password cannot be empty")
        }
        else if (username == "1" && password == "1"){
            errorMessageLabel.isHidden = true
            signInButton.configuration?.showsActivityIndicator = true
            signInButton.isEnabled = false
        }
        else if(username == "2" && password == "2"){
            print("go")
        }
        else{
            showError(withMessage: "Incorrect Username/password")
        }
        
        
    }
    
    private func showError(withMessage message: String){
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}

