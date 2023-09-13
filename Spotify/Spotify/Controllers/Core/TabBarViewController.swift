//
//  TabBarViewController.swift
//  Spotify
//
//  Created by Paula Rolim on 12/09/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewController1 = HomeViewController()
        let viewController2 = SearchViewController()
        let viewController3 = LibraryViewController()
        
        viewController1.title = "Home"
        viewController2.title = "Search"
        viewController3.title = "Library"
        
        viewController1.navigationItem.largeTitleDisplayMode = .always
        viewController2.navigationItem.largeTitleDisplayMode = .always
        viewController3.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: viewController1)
        let nav2 = UINavigationController(rootViewController: viewController2)
        let nav3 = UINavigationController(rootViewController: viewController3)
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 3)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav2, nav3], animated: true)
    }
}
