//
//  AppDelegate.swift
//  Bank App
//
//  Created by Alexandr Gerasimov on 08.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let pageViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool{
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor  = .systemBackground
        
        loginViewController.delegate = self
        pageViewController.delegate = self
        
        window?.rootViewController = loginViewController
        
        
        return true
    }
    
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
//        mainViewController.selectedIndex = 2
        setRootViewController(LocalStorage.hasOnboarded ? mainViewController : pageViewController)
    }
    
    
}

extension AppDelegate: OnboardingContainerViewControllerDelegate{
    func didFinishOnboarding() {
        if(!LocalStorage.hasOnboarded){
            LocalStorage.hasOnboarded = true
        }
        setRootViewController(mainViewController)
    }
    
    
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true){
        guard animated, let window = self.window else{
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}


