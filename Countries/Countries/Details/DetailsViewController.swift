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
    func didUpdateData(country: Country) {
        self.country = country
        DispatchQueue.main.async {
            self.rootView.nameLabel.text = country.name
            self.rootView.capitalLabel.text = country.capital
            self.rootView.flag.imageFromURL(country.flag)
            
            self.rootView.stopSkeleton()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
