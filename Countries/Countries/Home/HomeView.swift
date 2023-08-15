//
//  HomeView.swift
//  Countries
//
//  Created by Paula Rolim on 03/08/23.
//

import UIKit

class HomeView: UIView {    
    let titleLabel = {
        let label = DSLabel(fontSize: .h2, fontWeight: .bold)
        label.text = "Countries"
        label.startSkeleton()
        return label
    }()
    
    lazy var searchField =  {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Type a country name..."
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "SurfaceColor")?.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
        textField.rightViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 22)
        textField.autocorrectionType = .no
        return textField
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
        backgroundColor = UIColor(named: "BackgroundColor")
        list.backgroundColor = UIColor(named: "BackgroundColor")
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(searchField)
        addSubview(list)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            // title
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            // search
            searchField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            searchField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            searchField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            // list
            list.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 4),
            list.leadingAnchor.constraint(equalTo: leadingAnchor),
            list.trailingAnchor.constraint(equalTo: trailingAnchor),
            list.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // text field
            searchField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
