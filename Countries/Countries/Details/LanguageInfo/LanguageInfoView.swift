//
//  LanguageInfoView.swift
//  Countries
//
//  Created by Paula Rolim on 16/08/23.
//

import UIKit

class LanguageInfoView: UIView {
    private lazy var titleLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.text = "Languages"
        label.skeletonWidth = 120
        label.startSkeleton()
        return label
    }()
    
    private lazy var languagesLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.text = " "
        label.skeletonWidth = 200
        label.startSkeleton()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setupData(language: [String]) {
        languagesLabel.text = language.joined()
    }
    
    func stopSkeleton() {
        languagesLabel.stopSkeleton()
        titleLabel.stopSkeleton()
    }
    
    private func setupSubviews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(languagesLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: languagesLabel.topAnchor, constant: -4),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            languagesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            languagesLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            languagesLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            languagesLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }    
}
