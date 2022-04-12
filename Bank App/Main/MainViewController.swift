//
//  MainViewController.swift
//  Bank App
//
//  Created by Alexandr Gerasimov on 09.04.2022.
//

import UIKit


class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        tabBar.isTranslucent = false
//        style()
//        layout()
    }

    private func setupViews(){
        let summaryVC = AccountSummaryViewController()
        let moneyVC = UIViewController()
        let moreVC = UIViewController()
        
        moneyVC.title = "MOney"
        
        summaryVC.setTabBarItem(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarItem(imageName: "arrow.left.arrow.right", title: "Money")
        moreVC.setTabBarItem(imageName: "ellipsis.circle", title: "More")

        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)
        
        let tabBarList = [summaryNC, moneyNC, moreNC]
        
        self.viewControllers = tabBarList
        
    }
    
    private func hideNavigationBarLine(_ navBar: UINavigationBar){
        let image = UIImage()
        navBar.shadowImage = image
        navBar.setBackgroundImage(image, for: .default)
        navBar.isTranslucent = false
    }
    


}

extension MainViewController {
    
    func style(){
        
    }
    
    func layout(){

    }
    
    @objc func logoutTapped(_ sender: UIButton){
        
    }
}


