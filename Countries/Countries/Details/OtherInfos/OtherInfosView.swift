//
//  HeaderInfoView.swift
//  Countries
//
//  Created by Paula Rolim on 16/08/23.
//

import UIKit

class OtherInfosView: UIView {
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.addArrangedSubview(independentLabel)
        stack.addArrangedSubview(areaLabel)
        stack.addArrangedSubview(populationLabel)
        return stack
    }()
    
    private lazy var areaLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.text = "Area"
        label.skeletonWidth = 180
        label.startSkeleton()
        return label
    }()
    
    private lazy var populationLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.text = "Population"
        label.skeletonWidth = 180
        label.startSkeleton()
        return label
    }()
    
    private lazy var independentLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.text = "Independent"
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
    
    func setupData(area: Double, population: Int, independent: Bool) {
        independentLabel.text = "Independent: \(independent ? "yes" : "no")"
        areaLabel.text = "Area: \(area)"
        populationLabel.text = "Population: \(population)"
    }
    
    func stopSkeleton() {
        areaLabel.stopSkeleton()
        populationLabel.stopSkeleton()
        independentLabel.stopSkeleton()
    }
    
    private func setupSubviews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(verticalStack)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
}
