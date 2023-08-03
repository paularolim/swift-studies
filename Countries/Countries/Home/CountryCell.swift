//
//  CountryCell.swift
//  Countries
//
//  Created by Paula Rolim on 03/08/23.
//

import UIKit

class CountryCell: UITableViewCell {
    private lazy var horizontalStack = {
        let stack =  UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 24
        stack.backgroundColor = .white
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
        image.image = UIImage(named: "br")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    
    lazy var titleLabel = {
        let label = UILabel()
        label.text = "Country"
        return label
    }()
    
    lazy var capitalLabel = {
        let label = UILabel()
        label.text = "Capital"
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

extension CountryCell {
    func setup() {
        selectionStyle = .none
    }
    
    func addSubviews() {
        addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(flag)
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(capitalLabel)
        
        NSLayoutConstraint.activate([
            // horizontal stack
            horizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            // flag image
            flag.widthAnchor.constraint(equalToConstant: 120),
            flag.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
}

