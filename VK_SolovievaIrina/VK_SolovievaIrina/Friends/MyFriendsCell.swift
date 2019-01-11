//
//  MyFriendsCell.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 22.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit

@IBDesignable class MyFriendsCell: UITableViewCell {

    @IBOutlet var allFoto: [MyFriendsCell]!
//
//    @IBOutlet weak var friendName: UILabel!
//    @IBOutlet weak var fotoFriend: UIImageView!
    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var fotoFriend: UIImageView!
   // @IBOutlet weak var friendName: UIView!
   // @IBOutlet weak var fotoFriend: UIView!
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3)
//        {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
    
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
