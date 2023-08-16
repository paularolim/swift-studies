//
//  CurrencyInfoView.swift
//  Countries
//
//  Created by Paula Rolim on 16/08/23.
//

import UIKit

class CurrencyInfoView: UIView {
    private lazy var titleLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.text = "Currencies"
        label.skeletonWidth = 120
        label.startSkeleton()
        return label
    }()
    
    private lazy var currenciesLabel = {
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
    
    func setupData(currencies: [String]) {
        currenciesLabel.text = currencies.joined()
    }
    
    func stopSkeleton() {
        currenciesLabel.stopSkeleton()
        titleLabel.stopSkeleton()
    }
    
    private func setupSubviews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(currenciesLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: currenciesLabel.topAnchor, constant: -4),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            currenciesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            currenciesLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            currenciesLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            currenciesLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

}
