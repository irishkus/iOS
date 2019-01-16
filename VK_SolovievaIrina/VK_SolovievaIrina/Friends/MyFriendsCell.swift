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
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: "Cell")
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3)
        {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var radius: CGFloat = 10 {
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state

 
    }

//override func draw(_ rect: CGRect) {
//    super.draw(rect)
//
//        fotoFriend.layer.shadowOffset = shadowOffset
//        fotoFriend.layer.shadowRadius = shadowRadius
//        fotoFriend.layer.shadowOpacity = shadowOpacity
//
//    }
}
