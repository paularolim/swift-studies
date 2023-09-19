//
//  BordersView.swift
//  Countries
//
//  Created by Paula Rolim on 16/08/23.
//

import UIKit

class BordersView: UIView {
    
    private lazy var titleLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.text = "Borders"
        label.skeletonWidth = 180
        label.startSkeleton()
        return label
    }()
    
    lazy var countries: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor(named: "BackgroundColor")
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func setupSubviews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(countries)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: countries.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            countries.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            countries.leadingAnchor.constraint(equalTo: leadingAnchor),
            countries.bottomAnchor.constraint(equalTo: bottomAnchor),
            countries.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
