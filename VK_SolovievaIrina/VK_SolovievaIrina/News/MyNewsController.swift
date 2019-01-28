//
//  MyNewsController.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 07.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

class MyNewsController: UITableViewController {
 //@IBOutlet weak var fotosNews: MyNewsCollectionView!
    var allGroups = ["Абстракция", "Новый год", "Цветы", "Любовь", "Котики", "Собачки", "Кролики"]
 //   var allGroupsFoto = ["Абстракция": "line", "Новый год": "fir", "Цветы": "rose", "Любовь": "heart", "Котики": "red", "Собачки": "green", "Кролики": "orange"]
//    var allMyNews = ["Абстракция": "Идет набор в онлайн-университет для программистов от Mail Ru Group: обучение с нуля, упор на практику, совместная разработка, наставник и гарантия трудоустройства. В вашем обучении участвуют крупнейшие IT-компании России: Avito, Альфа-банк."]
//        //, "Новый год": "Жареные креветки в панцире. Просто, быстро - жарим креветки без очистки.", "Любовь": "Мы не знаем, что будет завтра. Пусть оно просто будет. И пусть в нём будут все те, кто нам дорог...", "Цветы": "У животных тоже есть дружба)"]
    var allMyNews = ["Абстракция": (groupsFoto: "line", textNews: "Идет набор в онлайн-университет для программистов от Mail Ru Group: обучение с нуля, упор на практику, совместная разработка, наставник и гарантия трудоустройства. В вашем обучении участвуют крупнейшие IT-компании России: Avito, Альфа-банк.", nameFotoNews: "fotoNews", commentNews: "20", shareNews: "3", viewNews: "756", like: 33), "Новый год": (groupsFoto: "fir", textNews: "Жареные креветки в панцире. Просто, быстро - жарим креветки без очистки.", nameFotoNews: "shrimp", commentNews: "293", shareNews: "43", viewNews: "7,6К", like: 367), "Цветы": (groupsFoto: "rose", textNews: "С добрый утром!", nameFotoNews: "mount", commentNews: "36", shareNews: "70", viewNews: "15К", like: 580)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        let layout = MyNewsLayout()
//        let a = MyNewsCollectionView(frame: self.view.frame)
//        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//        collectionView.dataSource = a
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allMyNews.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! MyNewsCell
        let group = allGroups[indexPath.row]
        cell.groupNewsName.text = group
       // let layout = MyNewsLayout()
       // let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
      //  collectionView.dataSource = self
//        let a = MyNewsCollectionView(frame: self.view.frame)
//        print(a)
//        cell.fotoNews.dataSource = a
       // a.collectionView(MyNewsCollectionView, cellForItemAt: IndexPath)
        //if let nameAvatar = allGroupsFoto[group] {
       // let collectionViewDataSource =
    //    a.dataSource = cell.fotosNews
        if let nameAvatar = allMyNews[group]?.groupsFoto {
            cell.groupNewsFoto.backgroundColor = UIColor.clear
            cell.groupNewsFoto.layer.shadowColor = UIColor.black.cgColor
            cell.groupNewsFoto.layer.shadowOffset = cell.shadowOffset
            cell.groupNewsFoto.layer.shadowOpacity = cell.shadowOpacity
            cell.groupNewsFoto.layer.shadowRadius = cell.shadowRadius
            cell.groupNewsFoto.layer.masksToBounds = false
            
            // add subview
            let borderView = UIView(frame: cell.groupNewsFoto.bounds)
            borderView.frame = cell.groupNewsFoto.bounds
            borderView.layer.cornerRadius = 25
            borderView.layer.masksToBounds = true
            cell.groupNewsFoto.addSubview(borderView)
            
            // add subcontent
            let photo = UIImageView()
            photo.image = UIImage(named: nameAvatar)
            photo.frame = borderView.bounds
            borderView.addSubview(photo)
            //cell.groupNewsFoto.image = UIImage(named: nameAvatar)
        }
        if let text = allMyNews[group]?.textNews {
            cell.textNews.text = text
        }
        cell.sumCommentNews.text = allMyNews[group]?.commentNews
        cell.sumShareNews.text = allMyNews[group]?.shareNews
        cell.sumViewNews.text = allMyNews[group]?.viewNews
      //  cell.collectionFotoNews.frame = CGRect(x: 0, y: 0, width: 360, height: 200)
        cell.collectionFotoNews.addSubview(UIImageView(image: UIImage(named: (allMyNews[group]?.nameFotoNews)!)))
      //  cell.fotoNews.image = UIImage(named: (allMyNews[group]?.nameFotoNews)!)
        cell.likeCell.label.text = String((allMyNews[group]?.like)!)
        cell.likeCell.like = (allMyNews[group]?.like)!
        return cell
    }
}

