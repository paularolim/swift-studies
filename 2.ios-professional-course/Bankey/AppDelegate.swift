//
//  AppDelegate.swift
//  Bankey
//
//  Created by Paula Rolim on 22/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let homeViewController = HomeViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        homeViewController.delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = loginViewController
        
        return true
    }
}

// MARK: - Animation
extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

// MARK: - LoginViewControllerDelegate
extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(homeViewController)
        } else {
            setRootViewController(onboardingContainerViewController)
        }
    }
}

// MARK: - OnboardingContainerViewControllerDelegate
extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(homeViewController)
    }
}

// MARK: - LogoutViewControllerDelegate
extension AppDelegate: LogoutViewControllerDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
}
