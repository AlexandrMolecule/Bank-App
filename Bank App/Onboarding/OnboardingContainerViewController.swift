//
//  OnboardingContainerViewController.swift
//  Bank App
//
//  Created by Alexandr Gerasimov on 09.04.2022.
//

import UIKit

protocol OnboardingContainerViewControllerDelegate: AnyObject{
    func didFinishOnboarding()
}

class OnboardingContainerViewController: UIViewController {
    weak var delegate: OnboardingContainerViewControllerDelegate?
    
    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController {
        didSet {
            guard let index = pages.firstIndex(of: currentVC) else {
                return
            }
            print(index)
            nextButton.isHidden = index + 1 == pages.count
            backButton.isHidden = index == 0
            doneButton.isHidden = index + 1 != pages.count
        }
    }
    
    let nextButton = UIButton(type: .system)
    let backButton = UIButton(type: .system)
    let doneButton = UIButton(type: .system)
    let closeButton = UIButton(type: .system)

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnboardingViewController(text: "1")
        let page2 = OnboardingViewController(text: "2")
        let page3 = OnboardingViewController(text: "3")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
        
        
    }
    
    private func setup(){
        view.backgroundColor = .systemPurple
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
        ])
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.first!
    }
    
    private func layout(){
        // CloseButton
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeButton.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: backButton.bottomAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: doneButton.trailingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: doneButton.bottomAnchor, multiplier: 2)
        ])
    }
    
    private func style(){
        styleButton(button: closeButton, title: "Close", action: #selector(closeTapped))
        styleButton(button: nextButton, title: "Next", action: #selector(nextTapped))
        styleButton(button: backButton, title: "Back", action: #selector(backTapped(_:)))
        styleButton(button: doneButton, title: "Done", action: #selector(doneTapped))

        view.addSubview(closeButton)
        view.addSubview(nextButton)
        view.addSubview(doneButton)
        view.addSubview(backButton)
    }
    
    private func styleButton(button: UIButton, title:String? = "", action: Selector?){
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: [])
        guard let action = action else {
            return
        }
        button.addTarget(self, action: action, for: .primaryActionTriggered)
    }
    
    
}

//MARK: Actions
extension OnboardingContainerViewController {
    @objc private func closeTapped(_ sender: UIButton){
        delegate?.didFinishOnboarding()
    }
    
    @objc private func doneTapped(_ sender: UIButton){
        delegate?.didFinishOnboarding()
    }
    
    @objc private func nextTapped(_ sender: UIButton){
        guard let nextVC = getNextViewController(from: self.currentVC) else {return}
        pageViewController.setViewControllers([nextVC], direction: .forward, animated: true, completion: nil)
    }
    
    @objc private func backTapped(_ sender: UIButton){
        guard let previousVC = getPreviousViewController(from: currentVC) else {return}
        pageViewController.setViewControllers([previousVC], direction: .reverse, animated: true, completion: nil)
    }
}


