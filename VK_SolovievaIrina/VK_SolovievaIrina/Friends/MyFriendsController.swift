//
//  MyFriends.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 22.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit



 class MyFriendsController: UITableViewController {
    
    var fotoDelegate = [String]()

    var myFriends = ["Иванов Иван", "Петров Петр", "Сидоров Сидор", "Субботин Андрей", "Соколов Дмитрий", "Смирнов Станислав", "Суворов Петр", "Павлова Арина", "Полякова Диана", "Петухов Александр", "Устинова Татьяна", "Ургант Валерий", "Уваров Денис", "Исаев Алексей", "Искакова Галина", "Ильина Екатерина", "Панов Евгений", "Павлова Анастасия", "Потапов Сергей", "Пестов Юрий", "Попова Евгения"]
    var fotoMyFriends = ["Иванов Иван": ["vk_logo","yellow", "red", "rose"], "Петров Петр": ["friend","green", "fir", "line"], "Сидоров Сидор": ["groups","orange", "blue", "heart"], "Субботин Андрей": ["yellow", "red"], "Соколов Дмитрий": ["green", "fir"], "Смирнов Станислав":["orange", "blue"], "Суворов Петр":["orange", "rose"], "Павлова Арина": ["orange"], "Полякова Диана": ["vk_logo","yellow"], "Петухов Александр": ["friend", "green"], "Устинова Татьяна": ["vk_logo"], "Ургант Валерий": ["friend"], "Уваров Денис": ["groups"], "Исаев Алексей": ["red"], "Искакова Галина": ["green"], "Ильина Екатерина": ["heart"], "Панов Евгений": ["line"], "Павлова Анастасия": ["yellow"], "Потапов Сергей": ["fir"], "Пестов Юрий": ["noLike"], "Попова Евгения": ["like"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myFriends.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! MyFriendsCell
        let friend = myFriends[indexPath.row]
        cell.friendName.text = friend
        if let nameAvatar = fotoMyFriends[friend]?.last {
            cell.fotoFriend.backgroundColor = UIColor.clear
            cell.fotoFriend.layer.shadowColor = UIColor.black.cgColor
            cell.fotoFriend.layer.shadowOffset = cell.shadowOffset
            cell.fotoFriend.layer.shadowOpacity = cell.shadowOpacity
            cell.fotoFriend.layer.shadowRadius = cell.shadowRadius
            cell.fotoFriend.layer.masksToBounds = false
            
            // add subview
            let borderView = UIView(frame: cell.fotoFriend.bounds)
            borderView.frame = cell.fotoFriend.bounds
            borderView.layer.cornerRadius = 35
            borderView.layer.masksToBounds = true
            cell.fotoFriend.addSubview(borderView)
            
            // add subcontent
            let photo = UIImageView()
            photo.image = UIImage(named: nameAvatar)
            photo.frame = borderView.bounds
            borderView.addSubview(photo)
            
        }
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "allFotoFriend" {
            let fotoFriendsController : FotoFriendCollectionController = segue.destination as! FotoFriendCollectionController
            let myFriendsController = segue.source as! MyFriendsController
            //  Получаем индекс выделенной ячейки
            if let indexPath = myFriendsController.tableView.indexPathsForSelectedRows {
                // Получаем друга по индексу
                let friend = myFriendsController.myFriends[indexPath[0].row]
                if let fotoDelegate = myFriendsController.fotoMyFriends[friend] as? [String] {
                    fotoFriendsController.fotoDelegate = fotoDelegate
                }
            }
        }
    }
    
}




