//
//  ShadowView.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 18.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

@IBDesignable class ShadowView: UIView {
    
    @IBOutlet weak var shadowView: UIView! {
        didSet {
            self.shadowView.layer.shadowOffset = shadowOffset
            self.shadowView.layer.shadowOpacity = self.shadowOpacity
            self.shadowView.layer.shadowRadius = self.shadowRadius
            self.shadowView.backgroundColor = .clear
            self.shadowView.layer.shadowColor = UIColor.black.cgColor
            self.shadowView.layer.shadowPath = UIBezierPath(ovalIn: self.shadowView.bounds).cgPath
        }
    }
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.clipsToBounds = true
            self.containerView.layer.cornerRadius = self.containerView.frame.width / 2
            // self.containerView.frame = self.shadowView.bounds
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3)
        {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// Прозрачность тени
    @IBInspectable var shadowOpacity: Float = 0.3
        {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// Радиус блура тени
    @IBInspectable var shadowRadius: CGFloat = 10
        {
        didSet {
            setNeedsDisplay()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.shadowView.layer.shadowOffset = shadowOffset
        self.shadowView.layer.shadowOpacity = self.shadowOpacity
        self.shadowView.layer.shadowRadius = self.shadowRadius
        self.shadowView.backgroundColor = .clear
        self.shadowView.layer.shadowColor = UIColor.black.cgColor
        self.shadowView.layer.shadowPath = UIBezierPath(ovalIn: self.shadowView.bounds).cgPath
        
        self.containerView.clipsToBounds = true
        self.containerView.layer.cornerRadius = self.containerView.frame.width / 2
        
    }

}
