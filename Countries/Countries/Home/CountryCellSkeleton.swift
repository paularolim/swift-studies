//
//  CountryCellSkeleton.swift
//  Countries
//
//  Created by Paula Rolim on 03/08/23.
//

import UIKit

class CountryCellSkeleton: UITableViewCell {
    private lazy var horizontalStack = {
        let stack =  UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 24
        stack.backgroundColor = UIColor(named: "SurfaceColor")
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.2
        stack.layer.shadowOffset = .zero
        stack.layer.shadowRadius = 6
        stack.layer.cornerRadius = 12
        return stack
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    private lazy var flag = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var flagLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        gradient.cornerRadius = 12
        return gradient
    }()
    
    private lazy var titleLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        label.text = " "
        label.skeletonWidth = 120
        label.startSkeleton()
        return label
    }()
    
    private lazy var capitalLabel = {
        let label = DSLabel()
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.skeletonWidth = 80
        label.startSkeleton()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Please use this class from code")
    }
}

extension CountryCellSkeleton {
    func setup() {
        selectionStyle = .none
        backgroundColor = UIColor(named: "BackgroundColor")

        // flag
        flag.layer.addSublayer(flagLayer)
        
        let flagGroup = makeAnimationGroup()
        flagGroup.beginTime = 0.0
        flagLayer.add(flagGroup, forKey: "backgroundColor")
    }
    
    func addSubviews() {
        addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(flag)
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(capitalLabel)
        
        NSLayoutConstraint.activate([
            // horizontal stack
            horizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            // flag image
            flag.widthAnchor.constraint(equalToConstant: 120),
            flag.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
}

extension CountryCellSkeleton: SkeletonLoadable {}
