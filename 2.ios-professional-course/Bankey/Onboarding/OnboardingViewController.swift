//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Paula Rolim on 22/08/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    let onboardingView = OnboardingView()
    
    init(imageName: String, description: String) {
        super.init(nibName: nil, bundle: nil)
        onboardingView.setupData(imageName: imageName, description: description)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setup()
    }
}

// MARK: - Setup
extension OnboardingViewController {
    private func setup() {
        view = onboardingView
    }
}
