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
    
    private lazy var flag: UIImageView = {
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
    
    private lazy var headerInfo = HeaderInfoView()
    
    private lazy var otherInfos = OtherInfosView()
    
    private lazy var languageInfo = LanguageInfoView()
    
    private lazy var currencyInfo = CurrencyInfoView()
    
    lazy var borderCountries: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor(named: "BackgroundColor")
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return collection
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
    
    func setupData(country: CountryDetails) {
        flag.imageFromURL(country.flag)
        headerInfo.setupData(name: country.name, capital: country.capital, region: country.region)
        otherInfos.setupData(area: country.area, population: country.population, independent: country.independent)
        languageInfo.setupData(language: [country.language])
        currencyInfo.setupData(currencies: [country.currencies])
    }
    
    func stopSkeleton() {
        headerInfo.stopSkeleton()
        otherInfos.stopSkeleton()
        languageInfo.stopSkeleton()
        currencyInfo.stopSkeleton()
        
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
        scrollView.addSubview(headerInfo)
        scrollView.addSubview(otherInfos)
        scrollView.addSubview(languageInfo)
        scrollView.addSubview(currencyInfo)
        scrollView.addSubview(borderCountries)
        
        flag.layer.addSublayer(flagLayer)
    }
    
    private func addConstraints() {
        let scrollContentGuide = scrollView.contentLayoutGuide
        let scrollFrameGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            // flag position
            flag.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            flag.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            flag.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            flag.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3),
            // scroll position
            scrollView.topAnchor.constraint(equalTo: flag.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            // header info
            headerInfo.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor, constant: 24),
            headerInfo.bottomAnchor.constraint(equalTo: otherInfos.topAnchor, constant: -36),
            headerInfo.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor, constant: 24),
            headerInfo.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor, constant: -24),
            headerInfo.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor, constant: 24),
            headerInfo.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor, constant: -24),
            // other infos
            otherInfos.topAnchor.constraint(equalTo: headerInfo.bottomAnchor, constant: 36),
            otherInfos.bottomAnchor.constraint(equalTo: languageInfo.topAnchor, constant: -36),
            otherInfos.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor, constant: 24),
            otherInfos.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor, constant: -24),
            otherInfos.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor, constant: 24),
            otherInfos.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor, constant: -24),
            // language info
            languageInfo.topAnchor.constraint(equalTo: otherInfos.bottomAnchor, constant: 36),
            languageInfo.bottomAnchor.constraint(equalTo: currencyInfo.topAnchor, constant: -36),
            languageInfo.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor, constant: 24),
            languageInfo.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor, constant: -24),
            languageInfo.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor, constant: 24),
            languageInfo.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor, constant: -24),
            // currency info
            currencyInfo.topAnchor.constraint(equalTo: languageInfo.bottomAnchor, constant: 36),
            currencyInfo.bottomAnchor.constraint(equalTo: borderCountries.topAnchor, constant: -36),
            currencyInfo.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor, constant: 24),
            currencyInfo.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor, constant: -24),
            currencyInfo.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor, constant: 24),
            currencyInfo.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor, constant: -24),
            // border countries
            borderCountries.topAnchor.constraint(equalTo: currencyInfo.bottomAnchor, constant: 36),
            borderCountries.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
            borderCountries.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            borderCountries.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            borderCountries.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor),
            borderCountries.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor),
            borderCountries.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension DetailsView: SkeletonLoadable {}
