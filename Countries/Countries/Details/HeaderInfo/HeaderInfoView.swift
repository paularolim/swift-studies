//
//  HeaderInfoView.swift
//  Countries
//
//  Created by Paula Rolim on 16/08/23.
//

import UIKit

class HeaderInfoView: UIView {
    private lazy var regionLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.text = "Region"
        label.skeletonWidth = 180
        label.startSkeleton()
        return label
    }()

    private lazy var nameLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        label.numberOfLines = 0
        label.text = "Name"
        label.skeletonWidth = 220
        label.startSkeleton()
        return label
    }()
    
    private lazy var capitalLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 0
        label.text = "Capital"
        label.skeletonWidth = 180
        label.startSkeleton()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setupData(name: String, capital: String, region: String) {
        regionLabel.text = region
        nameLabel.text = name
        capitalLabel.text = capital
    }
    
    func stopSkeleton() {
        nameLabel.stopSkeleton()
        capitalLabel.stopSkeleton()
        regionLabel.stopSkeleton()
    }
    
    private func setupSubviews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(regionLabel)
        addSubview(nameLabel)
        addSubview(capitalLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            regionLabel.topAnchor.constraint(equalTo: topAnchor),
            regionLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -24),
            regionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            regionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: regionLabel.bottomAnchor, constant: 24),
            nameLabel.bottomAnchor.constraint(equalTo: capitalLabel.topAnchor, constant: -4),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            capitalLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            capitalLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            capitalLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            capitalLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

}
