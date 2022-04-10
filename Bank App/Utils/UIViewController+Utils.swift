//
//  UIViewController+Utils.swift
//  Bank App
//
//  Created by Alexandr Gerasimov on 10.04.2022.
//

import UIKit

extension UIViewController {
    func setTabBarItem(imageName: String, title: String){
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
