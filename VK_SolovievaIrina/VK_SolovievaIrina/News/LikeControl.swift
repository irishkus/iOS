//
//  LikeControl.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 06.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

@IBDesignable class LikeControl: UIStackView {
    
    @IBInspectable var like = 45
    
    var likeActive = false
    var button = UIButton()
    var label = UILabel()
    
    class NewsGroup {
        var fotoGroup: String
        var textNews: String
        var nameGroup: String
        var like: Int
        var likeActive: Bool
        var button: UIButton?
        init(fotoGroup: String, textNews: String, nameGroup: String, like: Int, likeActive: Bool, button: UIButton?) {
            self.fotoGroup = fotoGroup
            self.textNews = textNews
            self.nameGroup = nameGroup
            self.like = like
            self.likeActive = likeActive
            self.button = button
        }
    }
    

    
//    let news1 = NewsGroup (fotoGroup: "line", textNews: "Идет набор в онлайн-университет для программистов от Mail Ru Group: обучение с нуля, упор на практику, совместная разработка, наставник и гарантия трудоустройства. В вашем обучении участвуют крупнейшие IT-компании России: Avito, Альфа-банк.", nameGroup: "Абстракция", like: 64, likeActive: false, button: nil)
//    let news2 = NewsGroup (fotoGroup:  "fir", textNews: "Жареные креветки в панцире. Просто, быстро - жарим креветки без очистки.", nameGroup: "Новый год", like: 35, likeActive: false, button: nil)
//    let news3 = NewsGroup (fotoGroup: "heart", textNews: "Мы не знаем, что будет завтра. Пусть оно просто будет. И пусть в нём будут все те, кто нам дорог...", nameGroup: "Любовь", like: 56, likeActive: false, button: nil)
//    let news4 = NewsGroup (fotoGroup:  "rose", textNews: "У животных тоже есть дружба)", nameGroup: "Цветы", like: 23, likeActive: false, button: nil)
//
//    var news = [news1, news2, news3, news4]
//    
//    var ratingMyNews = ["Абстракция": 64, "Новый год": 35, "Цветы": 23, "Любовь": 56]
    
//        {
//        didSet {
//            setupButtons()
//        }
//    }
    
  //  var textLabel = 3
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    

    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    func setupButtons()  {
        removeArrangedSubview(label)
        removeArrangedSubview(button)
        let bundle = Bundle(for: type(of: self))
        let filledHeart = UIImage(named: "like", in: bundle, compatibleWith: self.traitCollection)
        let emptyHeart = UIImage(named: "noLike", in: bundle, compatibleWith: self.traitCollection)
        label.text = String(like)
        addArrangedSubview(button)
        addArrangedSubview(label)
        label.leadingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: button.topAnchor, constant: 5.0).isActive = true
        if !likeActive {
            button.addTarget(self, action: #selector(LikeControl.likeButtonTapped(button:)), for: .touchUpInside)
            button.setImage(emptyHeart, for: .normal)
            button.setImage(filledHeart, for: .selected)
            label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        } else {
            button.addTarget(self, action: #selector(LikeControl.likeButtonTapped(button:)), for: .touchUpInside)
            button.setImage(filledHeart, for: .normal)
            button.setImage(emptyHeart, for: .selected)
            label.textColor = UIColor.red
        }

        
        
    }
    
    @objc func likeButtonTapped(button: UIButton) {
//        guard let like = ratingMyNews[] else {
//            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingMyNews)")
        print("Button pressed 👍")
        if !likeActive {
            likeActive = true
            like += 1
        } else {
            likeActive = false
            like -= 1
        }
        setupButtons()
    }
    
}
