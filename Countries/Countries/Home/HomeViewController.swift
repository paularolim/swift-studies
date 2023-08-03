//
//  HomeViewController.swift
//  Countries
//
//  Created by Paula Rolim on 02/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    private var homeManager = HomeManager()
    
    private var countries: [Country] = []
    
    private lazy var screenView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        view.addSubview(list)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Countries"
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        return label
    }()
    
    private lazy var list: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    }()

    public init() {
        super.init(nibName: nil, bundle: nil)
        
        list.delegate = self
        list.dataSource = self
        list.register(CountryCellView.self, forCellReuseIdentifier: "CountryCell")
        
        view.addSubview(screenView)
        view.backgroundColor = .white
        
        setupLayout()
        
        homeManager.delegate = self
        homeManager.getCountries()
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
    
    func setupLayout() {
        // screen container position
        view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: screenView.topAnchor, constant: 0).isActive = true
        view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: screenView.trailingAnchor, constant: 0).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: screenView.bottomAnchor, constant: 0).isActive = true
        view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 0).isActive = true
        
        // title position
        screenView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 0).isActive = true
        screenView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -24).isActive = true
        
        // list position
        screenView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: list.leadingAnchor, constant: 0).isActive = true
        screenView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: list.trailingAnchor, constant: 0).isActive = true
        screenView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: list.bottomAnchor, constant: 0).isActive = true
        titleLabel.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: list.topAnchor, constant: 0).isActive = true
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = countries[indexPath.row]
        
        let cell = list.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCellView
        
        cell.nameLabel.text = country.name
        cell.capitalLabel.text = country.capital
        cell.flag.image = UIImage(named: "br")
        cell.selectionStyle = .none
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countrySelected = countries[indexPath.row]
        
        let controller = DetailsViewController()
        controller.searchCountry = countrySelected.name
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension HomeViewController: HomeManagerDelegate {
    func didUpdateData(countries: [Country]) {
        self.countries = countries
        DispatchQueue.main.async {
            self.list.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print("error: \(error)")
    }
}
