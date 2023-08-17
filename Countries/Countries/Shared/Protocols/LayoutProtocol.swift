//
//  UIViewProtocol.swift
//  Countries
//
//  Created by Paula Rolim on 17/08/23.
//

protocol LayoutProtocol {
    associatedtype T
    
    func setupConstraints()
    func setupUI()
    func setupSubviews()
    func stopSkeleton()
    func setupData(data: T)
}

extension LayoutProtocol {
    func stopSkeleton() {}
}
