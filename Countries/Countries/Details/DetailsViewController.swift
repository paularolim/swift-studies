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
        
        rootView.borderCountries.delegate = self
        rootView.borderCountries.dataSource = self
        rootView.borderCountries.register(BorderCountryCell.self, forCellWithReuseIdentifier: "BorderCountryCell")
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

extension DetailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let countrySelected = country!.borders[indexPath.row]
        
        let controller = DetailsViewController()
        controller.searchCode = countrySelected
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension DetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return country?.borders.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = rootView.borderCountries.dequeueReusableCell(withReuseIdentifier: "BorderCountryCell", for: indexPath) as! BorderCountryCell
        cell.titleLabel.text = country?.borders[indexPath.row]
        return cell
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
            self.rootView.borderCountries.reloadData()
            
            self.rootView.stopSkeleton()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
