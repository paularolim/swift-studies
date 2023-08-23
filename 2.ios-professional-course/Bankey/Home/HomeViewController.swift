//
//  HomeViewController.swift
//  Bankey
//
//  Created by Paula Rolim on 23/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    var delegate: LogoutViewControllerDelegate?
    
    private var ds = DesignSystem()
    
    private lazy var titleLabel = ds.createLabel(text: "Welcome", fontSize: .title3)
    private lazy var logoutButton = ds.createButton(title: "Logout", action: #selector(logoutButtonTapped))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(logoutButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutButton.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }
    
    @objc private func logoutButtonTapped() {
        delegate?.didLogout()
    }
}
