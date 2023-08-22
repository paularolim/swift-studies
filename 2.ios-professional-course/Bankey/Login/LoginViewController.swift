//
//  LoginViewController.s wift
//  Bankey
//
//  Created by Paula Rolim on 22/08/23.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    
    override func viewDidLoad() {
        setup()
    }
}

// MARK: - Setup
extension LoginViewController {
    private func setup() {
        loginView.login = { self.login() }
        view = loginView
    }
}

// MARK: - Actions
extension LoginViewController {
    private func login() {
        guard let username = loginView.username, let password = loginView.password else {
            assertionFailure("Username and/or password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            loginView.configureView(withMessage: "Username and/or password cannot be blank")
            return
        }
        
        if username == "Abc" && password == "123" {
            print("Welcome!")
            loginView.configureView(shouldLoad: true)
            return
        }
        
        loginView.configureView(withMessage: "Incorrect username and/or password")
    }
}
