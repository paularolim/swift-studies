//
//  BordersViewController.swift
//  Countries
//
//  Created by Paula Rolim on 17/08/23.
//

import UIKit

class BordersViewController: CustomViewController<BordersView> {
    var borders: [String] = []
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        rootView.countries.delegate = self
        rootView.countries.dataSource = self
        rootView.countries.register(BorderCountryCell.self, forCellWithReuseIdentifier: "BorderCountryCell")
    }
    
    required init?(coder: NSCoder) { nil }
}

extension BordersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let countrySelected = borders[indexPath.row]
        
        let controller = DetailsViewController()
        controller.searchCode = countrySelected
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension BordersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return borders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = rootView.countries.dequeueReusableCell(withReuseIdentifier: "BorderCountryCell", for: indexPath) as! BorderCountryCell
        cell.titleLabel.text = borders[indexPath.row]
        return cell
    }
}
