//
//  MyFriendsCell.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 22.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit

class MyFriendsCell: UITableViewCell {

    @IBOutlet var allFoto: [MyFriendsCell]!
  //  @IBOutlet var allFoto: [MyFriendsCell]!
    @IBOutlet weak var fotoFriend: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    
    
  //  @IBAction weak var allFoto: MyFriendsCell!
//    
//   @IBAction func allFoto(segue: UIStoryboardSegue)
//   {
//        
//        // Проверяем идентификатор, чтобы убедится, что это нужный переход
//        if segue.identifier == "AllFoto" {
//            // Получаем ссылку на контроллер, с которого осуществлен переход
//            let myFriendsController = segue.source as! MyFriendsController
//            // Получаем индекс выделенной ячейки
//            if let indexPath = myFriendsController.tableView.indexPathForSelectedRow {
//                // Получаем друга по индексу
//            let friend = myFriendsController.myFriends[indexPath.row]
//                // Добавляем город в список выбранных городов
//            cities.append(city)
//                // Обновляем таблицу
//            
//            tableView.reloadData()
//            }
//            
//        }
//        
//    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! MyFriendsCell
//        let friend = myFriends[indexPath.row]
//        cell.friendName.text = friend
//        if let nameAvatar = fotoMyFriends[friend]?.last {
//            let photo = UIImage(named: nameAvatar)
//            cell.fotoFriend.image = photo
//            // Configure the cell...
//        }
//        return cell
//
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
