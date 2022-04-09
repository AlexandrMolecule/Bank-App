//
//  MainViewController.swift
//  Bank App
//
//  Created by Alexandr Gerasimov on 09.04.2022.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
  func  didLogout()
}

class MainViewController: UIViewController {
    weak var delegate : MainViewControllerDelegate?
    let stackView = UIStackView()
    let label = UILabel()
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension MainViewController {
    func style(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setTitle("Log Out", for: [])
        button.addTarget(self, action: #selector(logoutTapped), for: .primaryActionTriggered)
    }
    
    func layout(){
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        
        view.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func logoutTapped(_ sender: UIButton){
        delegate?.didLogout()
    }
}


