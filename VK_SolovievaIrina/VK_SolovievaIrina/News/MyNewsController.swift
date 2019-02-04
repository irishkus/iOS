//
//  MyNewsController.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 07.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

class MyNewsController: UITableViewController , MyNewsLayoutDelegate {

    var allGroups = ["Абстракция", "Новый год", "Цветы", "Любовь", "Котики", "Собачки", "Кролики"]
    
    private func image(at indexPath: IndexPath) -> UIImage {
        print("заходит 3")
        return UIImage(named: (allMyNews[allGroups[indexPath.row]]?.nameFotoNews[indexPath.row])!)!
    }

        var allMyNews:[String:(groupsFoto: String, textNews: String, nameFotoNews: [String], commentNews: String, shareNews: String, viewNews: String, like:Int)] = ["Абстракция": (groupsFoto: "line", textNews: "Идет набор в онлайн-университет для программистов от Mail Ru Group: обучение с нуля, упор на практику, совместная разработка, наставник и гарантия трудоустройства. В вашем обучении участвуют крупнейшие IT-компании России: Avito, Альфа-банк.", nameFotoNews: ["fotoNews"], commentNews: "20", shareNews: "3", viewNews: "756", like: 33), "Новый год": (groupsFoto: "fir", textNews: "Жареные креветки в панцире. Просто, быстро - жарим креветки без очистки.", nameFotoNews: ["shrimp", "shrimp2"], commentNews: "293", shareNews: "43", viewNews: "7,6К", like: 367), "Цветы": (groupsFoto: "rose", textNews: "С добрый утром!", nameFotoNews: ["mount", "mountain2", "mountain3"], commentNews: "36", shareNews: "70", viewNews: "15К", like: 580)]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func ratio (forItemAt indexPath: IndexPath) -> CGFloat {
        let image = self.image(at: indexPath)
        return image.size.width/image.size.height
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allMyNews.count
    }    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! MyNewsCell
        let group = allGroups[indexPath.row]
        cell.groupNewsName.text = group
        cell.allFotoNews = (allMyNews[group]?.nameFotoNews)!
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
        }
        if let text = allMyNews[group]?.textNews {
            cell.textNews.text = text
        }
        cell.sumCommentNews.text = allMyNews[group]?.commentNews
        cell.sumShareNews.text = allMyNews[group]?.shareNews
        cell.sumViewNews.text = allMyNews[group]?.viewNews
        cell.likeCell.label.text = String((allMyNews[group]?.like)!)
        cell.likeCell.like = (allMyNews[group]?.like)!
        return cell
    }
}



