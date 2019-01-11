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
    var characters: [String] = ["И", "П", "С", "У"]
    var myFriendsCharacter = ["Иванов Иван", "Петров Петр", "Сидоров Сидор", "Субботин Андрей"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return characters.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        myFriendsCharacter = myFriends.filter {$0[$0.startIndex] == Character(characters[section]) }
        return myFriendsCharacter.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        myFriendsCharacter = myFriends.filter {$0[$0.startIndex] == Character(characters[indexPath.section]) }
     //   myFriendsCharacter = myFriends.filter {$0.contains(characters[indexPath.section]) }
//        print("после сортировки \(myFriendsCharacter)")
//
//        print("количество строк в таблице \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! MyFriendsCell
        let friend = myFriendsCharacter[indexPath.row]
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

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return characters
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(characters[section])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "allFotoFriend" {
            let fotoFriendsController : FotoFriendCollectionController = segue.destination as! FotoFriendCollectionController
            let myFriendsController = segue.source as! MyFriendsController
            //  Получаем индекс выделенной ячейки
            if let indexPath = myFriendsController.tableView.indexPathForSelectedRow {
                myFriendsCharacter = myFriends.filter {$0[$0.startIndex] == Character(characters[indexPath.section]) }
                // Получаем друга по индексу
                let friend = myFriendsController.myFriendsCharacter[indexPath.row]
                if let fotoDelegate = myFriendsController.fotoMyFriends[friend] {
                    fotoFriendsController.fotoDelegate = fotoDelegate
                }
            }
        }
    }
    
}




