//
//  DetailsViewController.swift
//  Countries
//
//  Created by Paula Rolim on 02/08/23.
//

import UIKit

class DetailsViewController: UIViewController {
    private var detailsManager = DetailsManager()
    
    private var country: Country?
    
    public var searchCountry: String?
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(capitalLabel)
        return stack
    }()
    
    private lazy var flag: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "br")
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var capitalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 0
        return label
    }()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        view.addSubview(flag)
        view.addSubview(verticalStack)
        view.backgroundColor = .white
        
        setupLayout()
        
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
    
    func setupLayout() {
        // flag position
        flag.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        flag.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        flag.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        flag.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3).isActive = true
        
        // stack position
        verticalStack.topAnchor.constraint(equalTo: flag.bottomAnchor, constant: 24).isActive = true
        verticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
    }
}

extension DetailsViewController: DetailsManagerDelegate {
    func didUpdateData(country: Country) {
        self.country = country
        DispatchQueue.main.async {
            self.nameLabel.text = country.name
            self.capitalLabel.text = country.capital
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
