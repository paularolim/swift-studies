//
//  LoginViewController.s wift
//  Bankey
//
//  Created by Paula Rolim on 22/08/23.
//

import UIKit

protocol LogoutViewControllerDelegate: AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    let loginView = LoginView()
    
    weak var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        setup()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        loginView.configureView(shouldLoad: false)
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
            loginView.configureView(shouldLoad: true)
            delegate?.didLogin()
            return
        }
        
        loginView.configureView(withMessage: "Incorrect username and/or password")
    }
}
