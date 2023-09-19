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
        scroll.showsVerticalScrollIndicator = false
        scroll.alwaysBounceVertical = true
        scroll.clipsToBounds = true
        return scroll
    }()
    
    private lazy var flag: DSImage = {
        let image = DSImage(frame: .zero)
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.startSkeleton()
        return image
    }()
    
    private lazy var headerInfo = HeaderInfoView()
    
    private lazy var otherInfos = OtherInfosView()
    
    private lazy var languageInfo = LanguageInfoView()
    
    private lazy var currencyInfo = CurrencyInfoView()
    
    lazy var bordersInfo: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) { nil }

    private func configureSubviewConstraints(
        _ subview: UIView,
        below aboveView: UIView? = nil,
        above belowView: UIView? = nil,
        verticalSpacing: CGFloat? = nil,
        horizontalSpacing: CGFloat? = nil
    ) {
        let scrollContentGuide = scrollView.contentLayoutGuide
        let scrollFrameGuide = scrollView.frameLayoutGuide
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: aboveView?.bottomAnchor ?? scrollView.topAnchor, constant: verticalSpacing ?? 36),
            subview.bottomAnchor.constraint(equalTo: belowView?.topAnchor ?? scrollView.bottomAnchor, constant: -(verticalSpacing ?? 36)),
            subview.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor, constant: horizontalSpacing ?? 24),
            subview.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor, constant: -(horizontalSpacing ?? 24)),
            subview.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor, constant: horizontalSpacing ?? 24),
            subview.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor, constant: -(horizontalSpacing ?? 24)),
        ])
    }
}

extension DetailsView: LayoutProtocol {
    typealias T = CountryDetails
    
    func setupConstraints() {
        let flagHeight = UIScreen.main.bounds.height / 3
        
        flag.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            flag.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            flag.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            flag.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            flag.heightAnchor.constraint(equalToConstant: flagHeight)
        ])
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: flag.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        configureSubviewConstraints(headerInfo, above: otherInfos)
        
        configureSubviewConstraints(otherInfos, below: headerInfo, above: languageInfo)
        
        configureSubviewConstraints(languageInfo, below: otherInfos, above: currencyInfo)
        
        configureSubviewConstraints(currencyInfo, below: languageInfo, above: bordersInfo)
        
        configureSubviewConstraints(bordersInfo, below: currencyInfo, verticalSpacing: 0, horizontalSpacing: 0)
        NSLayoutConstraint.activate([
            bordersInfo.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupUI() {
        backgroundColor = UIColor(named: "BackgroundColor")
    }
    
    func setupSubviews() {
        addSubview(flag)
        addSubview(scrollView)
        scrollView.addSubview(headerInfo)
        scrollView.addSubview(otherInfos)
        scrollView.addSubview(languageInfo)
        scrollView.addSubview(currencyInfo)
        scrollView.addSubview(bordersInfo)
    }
    
    func stopSkeleton() {
        flag.stopSkeleton()
        headerInfo.stopSkeleton()
        otherInfos.stopSkeleton()
        languageInfo.stopSkeleton()
        currencyInfo.stopSkeleton()
    }
    
    func setupData(data: CountryDetails) {
        flag.imageFromURL(data.flag)
        headerInfo.setupData(name: data.name, capital: data.capital, region: data.region)
        otherInfos.setupData(area: data.area, population: data.population, independent: data.independent)
        languageInfo.setupData(language: [data.language])
        currencyInfo.setupData(currencies: [data.currencies])
    }
}

extension DetailsView: SkeletonLoadable {}
