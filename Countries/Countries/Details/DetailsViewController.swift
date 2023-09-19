//
//  DetailsViewController.swift
//  Countries
//
//  Created by Paula Rolim on 02/08/23.
//

import UIKit

class DetailsViewController: CustomViewController<DetailsView> {
    private var detailsManager = DetailsManager()
    
    private var bordersViewController = BordersViewController()
    
    private var country: CountryDetails?
    public var searchCode: String?
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        detailsManager.delegate = self
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if searchCode != nil && searchCode != "" {
            detailsManager.getDetails(code: searchCode!)
        }
    }
}

extension DetailsViewController: DetailsManagerDelegate {
    func didUpdateData(country: CountryDetails) {
        self.country = country
        DispatchQueue.main.async { [self] in
            self.rootView.setupData(data: country)
            self.rootView.stopSkeleton()
            self.bordersViewController.borders = country.borders
            self.addChild(bordersViewController)
            self.rootView.bordersInfo.addSubview(bordersViewController.rootView.countries)
            self.rootView.bordersInfo.topAnchor.constraint(equalTo: bordersViewController.rootView.countries.topAnchor).isActive = true
            self.rootView.bordersInfo.leadingAnchor.constraint(equalTo: bordersViewController.rootView.countries.leadingAnchor).isActive = true
            self.rootView.bordersInfo.bottomAnchor.constraint(equalTo: bordersViewController.rootView.countries.bottomAnchor).isActive = true
            self.rootView.bordersInfo.trailingAnchor.constraint(equalTo: bordersViewController.rootView.countries.trailingAnchor).isActive = true
            self.bordersViewController.rootView.countries.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
