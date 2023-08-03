//
//  CustomViewController.swift
//  Countries
//
//  Created by Paula Rolim on 03/08/23.
//

import UIKit

class CustomViewController<T: UIView>: UIViewController {
    public var rootView: T { return view as! T }
    
    override open func loadView() {
        self.view = T()
    }
}
