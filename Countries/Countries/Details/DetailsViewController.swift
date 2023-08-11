//
//  DetailsViewController.swift
//  Countries
//
//  Created by Paula Rolim on 02/08/23.
//

import UIKit

class DetailsViewController: CustomViewController<DetailsView> {
    private var detailsManager = DetailsManager()
    
    private var country: CountryDetails?
    public var searchCode: String?

    public init() {
        super.init(nibName: nil, bundle: nil)
        
        detailsManager.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("Please use this class from code")
    }
    
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
        DispatchQueue.main.async {
            self.rootView.nameLabel.text = country.name
            self.rootView.capitalLabel.text = country.capital
            self.rootView.flag.imageFromURL(country.flag)
            self.rootView.regionLabel.text = country.region
            self.rootView.areaLabel.text = "Area: \(country.area)"
            self.rootView.populationLabel.text = "Population: \(country.population)"
            self.rootView.languageLabel.text = "Languages: \(country.language)"
            self.rootView.currenciesLabel.text = "Currencies: \(country.currencies)"
            self.rootView.independentLabel.text = country.independent ? "Independent: yes" : "Independent: no"
            
            self.rootView.stopSkeleton()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
