//
//  MyNewsCollectionViewController.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 19.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class MyNewsCollectionView: UICollectionView {


//    self.dataSource = self
  //  collection.data
    
    var allGroups = ["Абстракция", "Новый год", "Цветы", "Любовь", "Котики", "Собачки", "Кролики"]
    //   var allGroupsFoto = ["Абстракция": "line", "Новый год": "fir", "Цветы": "rose", "Любовь": "heart", "Котики": "red", "Собачки": "green", "Кролики": "orange"]
    //    var allMyNews = ["Абстракция": "Идет набор в онлайн-университет для программистов от Mail Ru Group: обучение с нуля, упор на практику, совместная разработка, наставник и гарантия трудоустройства. В вашем обучении участвуют крупнейшие IT-компании России: Avito, Альфа-банк."]
    //        //, "Новый год": "Жареные креветки в панцире. Просто, быстро - жарим креветки без очистки.", "Любовь": "Мы не знаем, что будет завтра. Пусть оно просто будет. И пусть в нём будут все те, кто нам дорог...", "Цветы": "У животных тоже есть дружба)"]
    var allMyNews:[String:(groupsFoto: String, textNews: String, nameFotoNews: [String], commentNews: String, shareNews: String, viewNews: String, like:Int)] = ["Абстракция": (groupsFoto: "line", textNews: "Идет набор в онлайн-университет для программистов от Mail Ru Group: обучение с нуля, упор на практику, совместная разработка, наставник и гарантия трудоустройства. В вашем обучении участвуют крупнейшие IT-компании России: Avito, Альфа-банк.", nameFotoNews: ["fotoNews"], commentNews: "20", shareNews: "3", viewNews: "756", like: 33), "Новый год": (groupsFoto: "fir", textNews: "Жареные креветки в панцире. Просто, быстро - жарим креветки без очистки.", nameFotoNews: ["shrimp"], commentNews: "293", shareNews: "43", viewNews: "7,6К", like: 367), "Цветы": (groupsFoto: "rose", textNews: "С добрый утром!", nameFotoNews: ["mount"], commentNews: "36", shareNews: "70", viewNews: "15К", like: 580)]
    
}

extension MyNewsCollectionView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("заходит")
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // let group = allGroups[indexPath.row]
       // return allMyNews.counts
        print("заходит 2")
        return 1
    }
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsFotoCell", for: indexPath) as! MyNewsColCell
    print(cell)
        let group = allGroups[indexPath.row]
    print(group)
        cell.FotoNews.image = UIImage(named: (allMyNews[group]?.nameFotoNews[0])!)
  //  print("\(allMyNews[group]?.nameFotoNews[0]))")
        return cell
    }
}

extension MyNewsCollectionView: UICollectionViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("нажата строка № \(indexPath.row) в секции \(indexPath.section)")
    }


}

