//
//  LoginView.swift
//  Bankey
//
//  Created by Paula Rolim on 22/08/23.
//

import UIKit

class LoginView: UIView {
    @objc public var login: (() -> Void)?
    
    public var username: String? {
        usernameTextField.text
    }
    
    public var password: String? {
        passwordTextField.text
    }
    
    private var ds = DesignSystem()
    
    private lazy var titleLabel: UILabel = ds.createLabel(text: "Bankey", fontSize: .largeTitle)
    
    private lazy var descriptionLabel: UILabel = ds.createLabel(text: "Your premium source for all things banking!", fontSize: .title3)
    
    private lazy var stackView: UIStackView = ds.createStackView(backgroundColor: .secondarySystemBackground)
    
    private lazy var dividerView: UIView = ds.createDivider()
    
    private lazy var usernameTextField: UITextField = ds.createTextField(placeholder: "Username", delegate: self)
    
    private lazy var passwordTextField: UITextField = ds.createTextField(placeholder: "Password", delegate: self, isSecure: true)
    
    private lazy var signInButton: UIButton = ds.createButton(title: "Sign In", action: #selector(loginButtonTapped))
    
    private lazy var errorMessage: UILabel = ds.createLabel(text: "Error Message", fontSize: .body, color: .systemRed, isHidden: true)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup
extension LoginView {
    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(signInButton)
        addSubview(errorMessage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // title
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            
            // description
            descriptionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: descriptionLabel.bottomAnchor, multiplier: 3),
            trailingAnchor.constraint(equalToSystemSpacingAfter: descriptionLabel.trailingAnchor, multiplier: 1),
            
            // stack
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // divider
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            
            // button
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            
            // error message
            errorMessage.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessage.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessage.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor),
        ])
    }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            endEditing(true)
        }
        
        return false
    }
}

//MARK: - Actions
extension LoginView {
    @objc private func loginButtonTapped() {
        errorMessage.isHidden = true
        login?()
    }
    
    func configureView(withMessage message: String) {
        errorMessage.isHidden = false
        errorMessage.text = message
    }
    
    func configureView(shouldLoad: Bool) {
        signInButton.configuration?.showsActivityIndicator = shouldLoad
    }
}
