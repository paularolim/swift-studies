//
//  OnboardingView.swift
//  Bankey
//
//  Created by Paula Rolim on 22/08/23.
//

import UIKit

class OnboardingView: UIView {
    
    private var ds = DesignSystem()

    private lazy var stackView: UIStackView = ds.createStackView(spacing: 24)
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "delorean")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var descriptionLabel: UILabel = ds.createLabel(text: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.", fontSize: .title3)
    
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
extension OnboardingView {
    func setupData(imageName: String, description: String) {
        imageView.image = UIImage(named: imageName)
        descriptionLabel.text = description
    }
    
    func setupSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
        ])
    }
}
