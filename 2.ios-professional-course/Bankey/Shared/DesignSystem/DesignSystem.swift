//
//  CustomView.swift
//  Bankey
//
//  Created by Paula Rolim on 22/08/23.
//

import UIKit

struct DesignSystem {
    func createButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.imagePadding = 8
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    func createTextField(
        placeholder: String,
        delegate: UITextFieldDelegate,
        isSecure: Bool? = false
    ) -> UITextField {
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.isSecureTextEntry = isSecure == true
        tf.delegate = delegate
        return tf
    }
    
    func createLabel(
        text: String,
        fontSize: UIFont.TextStyle,
        color: UIColor? = .label,
        isHidden: Bool? = false
    ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.textColor = color
        label.font = UIFont.preferredFont(forTextStyle: fontSize)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.isHidden = (isHidden == true)
        return label
    }
    
    func createStackView(backgroundColor: UIColor? = nil, spacing: CGFloat? = nil) -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.backgroundColor = backgroundColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        stack.spacing = spacing ?? 8
        stack.layer.cornerRadius = 8
        stack.clipsToBounds = true
        return stack
    }
    
    func createDivider() -> UIView {
        let view = UIView()
        view.backgroundColor = .secondarySystemFill
        return view
    }
}
