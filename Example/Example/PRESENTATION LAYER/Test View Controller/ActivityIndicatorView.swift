//
//  ActivityIndicatorView.swift
//  Example
//
//  Created by Dima on 5/19/18.
//  hi@dimanikolaev.com
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//
    

import UIKit

class ActivityIndicatorView: UIView {
    
    private let replicatorSize = CGSize(width: 48, height: 48)
    private let indicatorWidth: CGFloat = 2.4
    private let indicatorColor = UIColor.black.cgColor
    
    private let replicator = CAReplicatorLayer()
    private let indicator = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _init()
    }
    
    private func _init() {
        indicator.frame = CGRect(origin: CGPoint(x: indicatorWidth/2, y: replicatorSize.height/2 - indicatorWidth/2),
                                 size: CGSize(width: indicatorWidth, height: indicatorWidth))
        indicator.fillColor = indicatorColor
        indicator.path = CGPath(ellipseIn: indicator.bounds, transform: nil)
        indicator.opacity = 0
        
        replicator.frame = CGRect(origin: .zero, size: replicatorSize)
        replicator.addSublayer(indicator)
        
        layer.addSublayer(replicator)
        
        backgroundColor = .white
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        let center = CGPoint(x: layer.frame.midX - replicatorSize.width/2,
                             y: layer.frame.midY - replicatorSize.height/2)
        replicator.frame.origin = center
    }
    
    func beginAnimation() {
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0
        opacityAnimation.duration = 1
        opacityAnimation.repeatCount = Float.greatestFiniteMagnitude
        
        let instanceCount = 92
        replicator.instanceCount = instanceCount
        replicator.instanceDelay = opacityAnimation.duration / CFTimeInterval(instanceCount)
        
        let angle = CGFloat.pi * 2 / CGFloat(instanceCount)
        replicator.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        indicator.add(opacityAnimation, forKey: nil)
    }
    
    func finishAnimation() {
        indicator.removeAllAnimations()
    }
    
}
