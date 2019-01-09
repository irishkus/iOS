//
//  MyNewsCell.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 07.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

class MyNewsCell: UITableViewCell {

 //   @IBOutlet weak var gpoupNewsFoto: UIImageView!
    
//    @IBOutlet weak var groupNewsFoto: UIImageView!
//    @IBOutlet weak var groupNewsName: UILabel!
//    @IBOutlet weak var textNews: UILabel!

    @IBOutlet weak var textNews: UILabel!
    @IBOutlet weak var groupNewsName: UILabel!
    @IBOutlet weak var groupNewsFoto: UIImageView!
    @IBOutlet weak var likeCell: LikeControl!
    
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
