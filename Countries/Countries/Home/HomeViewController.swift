//
//  HomeViewController.swift
//  Countries
//
//  Created by Paula Rolim on 02/08/23.
//

import UIKit

class HomeViewController: CustomViewController<HomeView> {
    
    private var isLoading = true
    private var countries: [Country] = []
    
    private var manager = HomeManager()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        manager.delegate = self
        manager.getCountries()
        
        rootView.list.delegate = self
        rootView.list.dataSource = self
        rootView.list.register(CountryCellSkeleton.self, forCellReuseIdentifier: "CountryCellSkeleton")
        rootView.list.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("Please use this class from code")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isLoading {
            return 6
        } else {
            return countries.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLoading {
            return rootView.list.dequeueReusableCell(withIdentifier: "CountryCellSkeleton", for: indexPath) as! CountryCellSkeleton
        } else {
            let country = countries[indexPath.row]
            
            let cell = rootView.list.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
            cell.titleLabel.text = country.name
            cell.capitalLabel.text = country.capital
            return cell
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !isLoading {
            let countrySelected = countries[indexPath.row]
            
            let controller = DetailsViewController()
            controller.searchCountry = countrySelected.name
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

extension HomeViewController: HomeManagerDelegate {
    func didUpdateData(countries: [Country]) {
        self.isLoading = false
        self.countries = countries
        DispatchQueue.main.async {
            self.rootView.list.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
