//
//  ReusableLabel.swift
//  Countries
//
//  Created by Paula Rolim on 04/08/23.
//

import UIKit

class DSLabel: UILabel {
    enum FontSizeEnum {
        case h1
        case h2
        case h3
    }
    
    public private(set) var fontSize: FontSizeEnum
    public private(set) var fontWeight: UIFont.Weight
    
    public var skeletonWidth: CGFloat?
    public var skeletonHeight: CGFloat?
    
    private lazy var skeletonLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = 8
        return gradient
    }()
    
    init(fontSize: FontSizeEnum? = nil, fontWeight: UIFont.Weight? = nil) {
        self.fontSize = fontSize ?? FontSizeEnum.h1
        self.fontWeight = fontWeight ?? .regular
        
        super.init(frame: .zero)
        
        configureFontSize()
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        let position = bounds.origin
        let width = skeletonWidth ?? bounds.size.width
        let height = skeletonHeight ?? bounds.size.height
        skeletonLayer.frame = CGRect(x: position.x, y: position.y, width: width, height: height)
    }
    
    private func configureFontSize() {
        switch fontSize {
        case .h1:
            self.font = UIFont.systemFont(ofSize: 32, weight: self.fontWeight)
        case .h2:
            self.font = UIFont.systemFont(ofSize: 24, weight: self.fontWeight)
        case .h3:
            self.font = UIFont.systemFont(ofSize: 16, weight: self.fontWeight)
        }
    }
    
    func startSkeleton() {
        layer.addSublayer(skeletonLayer)

        let group = makeAnimationGroup()
        group.beginTime = 0.0
        skeletonLayer.add(group, forKey: "backgroundColor")
    }
    
    func stopSkeleton() {
        skeletonLayer.removeAllAnimations()
    }
}

extension DSLabel: SkeletonLoadable {}
