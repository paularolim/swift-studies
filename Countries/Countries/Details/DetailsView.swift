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
    
    private lazy var flagLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
        return gradient
    }()
    
    lazy var nameLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        label.numberOfLines = 0
        label.text = " "
        label.skeletonWidth = 220
        label.startSkeleton()
        return label
    }()
    
    lazy var capitalLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 0
        label.text = " "
        label.skeletonWidth = 180
        label.startSkeleton()
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
    
    func stopSkeleton() {
        nameLabel.stopSkeleton()
        capitalLabel.stopSkeleton()
        flag.layer.sublayers?.removeAll()
    }
    
    private func setupUI() {
        backgroundColor = UIColor(named: "BackgroundColor")
        
        let flagGroup = makeAnimationGroup()
        flagGroup.beginTime = 0.0
        flagLayer.add(flagGroup, forKey: "backgroundColor")
    }
    
    private func addSubviews() {
        addSubview(flag)
        addSubview(verticalStack)
        
        flag.layer.addSublayer(flagLayer)
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

extension DetailsView: SkeletonLoadable {}
