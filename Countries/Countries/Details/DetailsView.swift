//
//  DetailsView.swift
//  Countries
//
//  Created by Paula Rolim on 10/08/23.
//

import UIKit

class DetailsView: UIView {
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(capitalLabel)
        return stack
    }()
    
    lazy var flag: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var capitalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 0
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        backgroundColor = UIColor(named: "BackgroundColor")
    }
    
    private func addSubviews() {
        addSubview(flag)
        addSubview(verticalStack)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            // flag position
            flag.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            flag.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            flag.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            flag.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3),
            // stack position
            verticalStack.topAnchor.constraint(equalTo: flag.bottomAnchor, constant: 24),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
}
