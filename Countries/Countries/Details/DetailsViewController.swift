//
//  DetailsViewController.swift
//  Countries
//
//  Created by Paula Rolim on 02/08/23.
//

import UIKit

class DetailsViewController: CustomViewController<DetailsView> {
    private var detailsManager = DetailsManager()
    
    private var country: Country?
    public var searchCountry: String?

    public init() {
        super.init(nibName: nil, bundle: nil)
        
        detailsManager.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("Please use this class from code")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if searchCountry != nil {
            detailsManager.getDetails(name: searchCountry!)
        }
    }
}

extension DetailsViewController: DetailsManagerDelegate {
    func didUpdateData(country: Country) {
        self.country = country
        DispatchQueue.main.async {
            self.rootView.nameLabel.text = country.name
            self.rootView.capitalLabel.text = country.capital
            self.rootView.flag.imageFromURL(country.flag)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
