//
//  LoadNewView.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 28.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

class LoadNewView: UIView {

    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
//2
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.white.cgColor)
        //2
        let circleLayer = CAShapeLayer()
        circleLayer.backgroundColor = UIColor.red.cgColor
        circleLayer.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        circleLayer.position = CGPoint(x: 57, y: 60)
        circleLayer.fillRule = CAShapeLayerFillRule.evenOdd
        circleLayer.strokeColor = UIColor.red.cgColor
        
     //  self.layer.backgroundColor = UIColor.red.cgColor
      //  self.layoutSublayers(of: circleLayer)
    //    let maskLayer = CAShapeLayer()
        let cloudPath = UIBezierPath()
        cloudPath.lineWidth = 3.0
        cloudPath.move(to: CGPoint(x: 57, y: 60))
        cloudPath.addLine(to: CGPoint(x: 15, y: 60))
        cloudPath.addArc(withCenter: CGPoint(x: 15, y: 52), radius: 8, startAngle: .pi/2, endAngle: -.pi/3, clockwise: true)
        cloudPath.addArc(withCenter: CGPoint(x: 37, y: 50), radius: 20, startAngle: .pi/0.9, endAngle: -.pi/5, clockwise: true)
        cloudPath.addArc(withCenter: CGPoint(x: 59, y: 49), radius: 12, startAngle: -.pi/1.4, endAngle: .pi/3, clockwise: true)
        cloudPath.close()
        cloudPath.stroke()
        


       self.layer.mask = circleLayer
        
       // self.layer.maskedCorners
        
        let followPathAnimation = CAKeyframeAnimation(keyPath: "position")
        followPathAnimation.path = cloudPath.cgPath
        followPathAnimation.calculationMode = CAAnimationCalculationMode.paced
        followPathAnimation.repeatCount = Float.infinity
        followPathAnimation.duration = 4.0
       // maskLayer.add(followPathAnimation, forKey: nil)
       
        
        // self.layer.addSublayer(circleLayer)
       // self.layer.mask?.addSublayer(circleLayer)
        circleLayer.add(followPathAnimation, forKey: nil)
        
    }
}
