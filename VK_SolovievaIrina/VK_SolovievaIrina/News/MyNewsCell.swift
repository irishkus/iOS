//
//  MyNewsCell.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 07.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

class MyNewsCell: UITableViewCell {//, UICollectionViewDataSource {
//
//    var allGroups = ["Абстракция", "Новый год", "Цветы", "Любовь", "Котики", "Собачки", "Кролики"]
//    //   var allGroupsFoto = ["Абстракция": "line", "Новый год": "fir", "Цветы": "rose", "Любовь": "heart", "Котики": "red", "Собачки": "green", "Кролики": "orange"]
//    //    var allMyNews = ["Абстракция": "Идет набор в онлайн-университет для программистов от Mail Ru Group: обучение с нуля, упор на практику, совместная разработка, наставник и гарантия трудоустройства. В вашем обучении участвуют крупнейшие IT-компании России: Avito, Альфа-банк."]
//    //        //, "Новый год": "Жареные креветки в панцире. Просто, быстро - жарим креветки без очистки.", "Любовь": "Мы не знаем, что будет завтра. Пусть оно просто будет. И пусть в нём будут все те, кто нам дорог...", "Цветы": "У животных тоже есть дружба)"]
//    var allMyNews:[String:(groupsFoto: String, textNews: String, nameFotoNews: [String], commentNews: String, shareNews: String, viewNews: String, like:Int)] = ["Абстракция": (groupsFoto: "line", textNews: "Идет набор в онлайн-университет для программистов от Mail Ru Group: обучение с нуля, упор на практику, совместная разработка, наставник и гарантия трудоустройства. В вашем обучении участвуют крупнейшие IT-компании России: Avito, Альфа-банк.", nameFotoNews: ["fotoNews"], commentNews: "20", shareNews: "3", viewNews: "756", like: 33), "Новый год": (groupsFoto: "fir", textNews: "Жареные креветки в панцире. Просто, быстро - жарим креветки без очистки.", nameFotoNews: ["shrimp"], commentNews: "293", shareNews: "43", viewNews: "7,6К", like: 367), "Цветы": (groupsFoto: "rose", textNews: "С добрый утром!", nameFotoNews: ["mount"], commentNews: "36", shareNews: "70", viewNews: "15К", like: 580)]
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        print("заходит")
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        // let group = allGroups[indexPath.row]
//        // return allMyNews.counts
//        print("заходит 2")
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsFotoCell", for: indexPath) as! MyNewsColCell
//        print(cell)
//        let group = allGroups[indexPath.row]
//        print(group)
//        cell.FotoNews.image = UIImage(named: (allMyNews[group]?.nameFotoNews[0])!)
//          print(" ==== \(allMyNews[group]?.nameFotoNews[0]))")
//        return cell
//    }
    


    @IBOutlet weak var sumViewNews: UILabel!
    @IBOutlet weak var sumShareNews: UILabel!
    @IBOutlet weak var sumCommentNews: UILabel!
    @IBOutlet weak var textNews: UILabel!
    @IBOutlet weak var groupNewsName: UILabel!
    @IBOutlet weak var groupNewsFoto: UIImageView!
    @IBOutlet weak var likeCell: LikeControl!
    
    @IBOutlet weak var collectionFotoNews: UICollectionView!
    // @IBOutlet weak var fotosNews: CollectionView!

//        {
//        get {
//     let a = MyNewsCollectionView()
//        print(a)
//        self.fotoNews.dataSource = a
//        print(self.fotoNews)
//        return self.fotoNews
//        }
//    }
    
//    
//        {
//        fotosNews.dataSource = 
//    }
//        fotosNews.dataSource = self
       //UICollectionViewDataSource.
    

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
     //   fotoNews.dataSource = self
      //  fotoNews.delegate = self
//        fotoNews.register(UINib.init(nibName: "NewsAdvancedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsAdvancedCollectionViewReusableCell")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
