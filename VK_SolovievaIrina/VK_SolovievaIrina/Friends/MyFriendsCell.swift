//
//  MyFriendsCell.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 22.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit

@IBDesignable class MyFriendsCell: UITableViewCell {

  //  @IBOutlet var allFoto: [MyFriendsCell]!
  //  private var shadowLayer: CAShapeLayer!
    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var fotoFriend: UIImageView!

    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
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
    
    /// Прозрачность тени
    @IBInspectable var shadowOpacity: Float = 0.3
//        {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
    
    /// Радиус блура тени
    @IBInspectable var shadowRadius: CGFloat = 10
//        {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state

 
    }

}
