//
//  DetailsView.swift
//  Countries
//
//  Created by Paula Rolim on 10/08/23.
//

import UIKit

class DetailsView: UIView {
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        scroll.alwaysBounceVertical = true
        scroll.clipsToBounds = true
        return scroll
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.addArrangedSubview(regionLabel)
        stack.addArrangedSubview(separatorView1)
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(capitalLabel)
        stack.addArrangedSubview(separatorView2)
        stack.addArrangedSubview(independentLabel)
        stack.addArrangedSubview(areaLabel)
        stack.addArrangedSubview(populationLabel)
        stack.addArrangedSubview(languageLabel)
        stack.addArrangedSubview(currenciesLabel)
        return stack
    }()
    
    private lazy var separatorView1 = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 18).isActive = true
        return view
    }()
    
    private lazy var separatorView2 = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return view
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
    
    lazy var languageLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.text = " "
        label.skeletonWidth = 180
        label.startSkeleton()
        return label
    }()
    
    lazy var independentLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.text = " "
        label.skeletonWidth = 180
        label.startSkeleton()
        return label
    }()
    
    lazy var currenciesLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.text = " "
        label.skeletonWidth = 180
        label.startSkeleton()
        return label
    }()
    
    lazy var regionLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.text = " "
        label.skeletonWidth = 180
        label.startSkeleton()
        return label
    }()
    
    lazy var areaLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.text = " "
        label.skeletonWidth = 180
        label.startSkeleton()
        return label
    }()
    
    lazy var populationLabel = {
        let label = DSLabel()
        label.font = UIFont.systemFont(ofSize: 22)
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
        languageLabel.stopSkeleton()
        independentLabel.stopSkeleton()
        currenciesLabel.stopSkeleton()
        regionLabel.stopSkeleton()
        areaLabel.stopSkeleton()
        populationLabel.stopSkeleton()
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
        addSubview(scrollView)
        scrollView.addSubview(verticalStack)
        
        flag.layer.addSublayer(flagLayer)
    }
    
    private func addConstraints() {
        let scrollContentGuide = scrollView.contentLayoutGuide
        let scrollFrameGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            // flag position
            flag.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            flag.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            flag.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            flag.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3),
            // scroll position
            scrollView.topAnchor.constraint(equalTo: flag.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            // stack position
            verticalStack.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor, constant: 24),
            verticalStack.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor),
        ])
    }
}

extension DetailsView: SkeletonLoadable {}
