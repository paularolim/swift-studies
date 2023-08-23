//
//  MainViewController.swift
//  Bankey
//
//  Created by Paula Rolim on 23/08/23.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

//MARK: - Setup
extension MainViewController {
    private func setup() {
        tabBar.tintColor = .label
        tabBar.isTranslucent = false
        
        let accountSummaryViewController = AccountSummaryViewController()
        let moveMoneyViewController = MoveMoneyViewController()
        let moreViewController = MoreViewController()
        
        let accountSummaryTab = UITabBarItem(
            title: "Summary",
            image: UIImage(systemName: "list.dash.header.rectangle"),
            selectedImage: UIImage(systemName: "list.dash.header.rectangle"))
        let moveMoneyTab = UITabBarItem(
            title: "Move Money",
            image: UIImage(systemName: "arrow.left.arrow.right"),
            selectedImage: UIImage(systemName: "arrow.left.arrow.right"))
        let moreTab = UITabBarItem(
            title: "More",
            image: UIImage(systemName: "ellipsis.circle"),
            selectedImage: UIImage(systemName: "ellipsis.circle"))
        
        accountSummaryViewController.tabBarItem = accountSummaryTab
        moveMoneyViewController.tabBarItem = moveMoneyTab
        moreViewController.tabBarItem = moreTab
        
        viewControllers = [accountSummaryViewController, moveMoneyViewController, moreViewController]
    }
}

class AccountSummaryViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
    }
}

class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
