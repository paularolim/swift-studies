//
//  DSImage.swift
//  Countries
//
//  Created by Paula Rolim on 17/08/23.
//

import UIKit

class DSImage: UIImageView {
    public var skeletonWidth: CGFloat?
    public var skeletonHeight: CGFloat?
    
    private lazy var skeletonLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        return gradient
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func layoutSubviews() {
        let position = bounds.origin
        let width = skeletonWidth ?? bounds.size.width
        let height = skeletonHeight ?? bounds.size.height
        skeletonLayer.frame = CGRect(x: position.x, y: position.y, width: width, height: height)
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

extension DSImage: SkeletonLoadable {}
