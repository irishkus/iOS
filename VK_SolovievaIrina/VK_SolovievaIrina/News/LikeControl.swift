//
//  LikeControl.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 06.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

class LikeControl: UIView {
    
    var like = 0
    var likeActive = false
    var button = UIButton()
    var label = UILabel()
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButtons()
    }
    
    func setupButtons()  {
        let bundle = Bundle(for: type(of: self))
        let filledHeart = UIImage(named: "like", in: bundle, compatibleWith: self.traitCollection)
        let emptyHeart = UIImage(named: "noLike", in: bundle, compatibleWith: self.traitCollection)
        label.text = String(like)
        stackView = UIStackView(arrangedSubviews: [button, label])
       // self.addSubview(stackView)
        self.addSubview(button)
        self.addSubview(label)
        label.leadingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: button.topAnchor, constant: 5.0).isActive = true
        if !likeActive {
            button.addTarget(self, action: #selector(LikeControl.likeButtonTapped(button:)), for: .touchUpInside)
            button.setImage(emptyHeart, for: .normal)
            button.setImage(filledHeart, for: .selected)
            label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            label.font = UIFont(name: label.font.fontName, size: 15)
        } else {
            button.addTarget(self, action: #selector(LikeControl.likeButtonTapped(button:)), for: .touchUpInside)
            button.setImage(filledHeart, for: .normal)
            button.setImage(emptyHeart, for: .selected)
            label.textColor = UIColor.red
        }
    }
    
    @objc func likeButtonTapped(button: UIButton) {
        if !likeActive {
            likeActive = true
            like += 1
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.01,
                           initialSpringVelocity: 0.1,
                           options: [],
                           animations: {
                            self.label.frame.origin.y -= 20
            })
        } else {
            likeActive = false
            like -= 1
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.001,
                           initialSpringVelocity: 0.1,
                           options: [],
                           animations: {
                            self.label.frame.origin.x = 40
            })
        }
        setupButtons()
    }
}
