//
//  CountryCell.swift
//  Countries
//
//  Created by Paula Rolim on 02/08/23.
//

import UIKit

class CountryCellView: UITableViewCell {
    
    public lazy var horizontalStack: UIStackView = {
        let stack = UIStackView()
        
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
        
        stack.addArrangedSubview(flag)
        stack.addArrangedSubview(verticalStack)
        
        return stack
    }()
    
    public lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .leading
        stack.spacing = 4

        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(capitalLabel)
        
        return stack
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28.0, weight: .bold)
        return label
    }()
    
    public lazy var capitalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22.0)
        return label
    }()
    
    public lazy var flag: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(horizontalStack)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Please use this class from code")
    }
    
    func setupLayout() {
        // horizontal stack position
        contentView.topAnchor.constraint(equalTo: horizontalStack.topAnchor, constant: -10).isActive = true
        contentView.trailingAnchor.constraint(equalTo: horizontalStack.trailingAnchor, constant: 24).isActive = true
        contentView.bottomAnchor.constraint(equalTo: horizontalStack.bottomAnchor, constant: 10).isActive = true
        contentView.leadingAnchor.constraint(equalTo: horizontalStack.leadingAnchor, constant: -24).isActive = true
        
        // flag anchor
        flag.widthAnchor.constraint(equalToConstant: 120).isActive = true
        flag.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
}
