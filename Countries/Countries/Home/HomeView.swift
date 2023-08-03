//
//  HomeView.swift
//  Countries
//
//  Created by Paula Rolim on 03/08/23.
//

import UIKit

class HomeView: UIView {
    lazy var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Countries"
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        return label
    }()
    
    lazy var list: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        backgroundColor = .white
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(list)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            // title
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            // list
            list.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            list.leadingAnchor.constraint(equalTo: leadingAnchor),
            list.trailingAnchor.constraint(equalTo: trailingAnchor),
            list.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}