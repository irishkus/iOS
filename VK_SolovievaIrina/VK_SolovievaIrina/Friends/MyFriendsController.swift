//
//  MyFriends.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 22.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit

//extension MyFriendsController: UISearchResultsUpdating {
//    // MARK: - UISearchResultsUpdating Delegate
//    func updateSearchResults(for searchController: UISearchController) {
//        // TODO
//    }
//}

 class MyFriendsController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchFriends: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)
    var searchActive : Bool = false
    var fotoDelegate = [String]()
    private var shadowLayer: CAShapeLayer!
    var filteredFriends: [String] = []
    
    var myFriends = ["Иванов Иван", "Петров Петр", "Сидоров Сидор", "Субботин Андрей", "Соколов Дмитрий", "Смирнов Станислав", "Суворов Петр", "Павлова Арина", "Полякова Диана", "Петухов Александр", "Устинова Татьяна", "Ургант Валерий", "Уваров Денис", "Исаев Алексей", "Искакова Галина", "Ильина Екатерина", "Панов Евгений", "Давлова Анастасия", "Потапов Сергей", "Вестов Юрий", "Попова Евгения", "Тимофеев Антон"]
    var fotoMyFriends = ["Иванов Иван": ["vk_logo","yellow", "red", "rose"], "Петров Петр": ["friend","green", "fir", "line"], "Сидоров Сидор": ["groups","orange", "blue", "heart"], "Субботин Андрей": ["yellow", "red"], "Соколов Дмитрий": ["green", "fir"], "Смирнов Станислав":["orange", "blue"], "Суворов Петр":["orange", "rose"], "Павлова Арина": ["orange"], "Полякова Диана": ["vk_logo","yellow"], "Петухов Александр": ["friend", "green"], "Устинова Татьяна": ["vk_logo"], "Ургант Валерий": ["friend"], "Уваров Денис": ["groups"], "Исаев Алексей": ["red"], "Искакова Галина": ["green"], "Ильина Екатерина": ["heart"], "Панов Евгений": ["line"], "Давлова Анастасия": ["yellow"], "Потапов Сергей": ["fir"], "Вестов Юрий": ["noLike"], "Попова Евгения": ["like"], "Тимофеев Антон": ["rose"]]
    var characters: [String] =  ["В", "Д", "И", "П", "С", "Т", "У"]
    var myFriendsCharacter = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != "" {
            filteredFriends = myFriends.filter({(text) -> Bool in
                let tmp: NSString = text as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            searchActive = true
            tableView.reloadData()
            print("FF")
            print(filteredFriends)
        }
        else {
            searchActive = false
            tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Зашел в cancel")
        searchBar.text = ""
        searchActive = false
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        print("Зашел в empty")
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return characters.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchActive {
            myFriendsCharacter = filteredFriends.filter {$0[$0.startIndex] == Character(characters[section]) }
          //  print(myFriendsCharacter)
        } else {
            myFriendsCharacter = myFriends.filter {$0[$0.startIndex] == Character(characters[section]) }
           //  print(myFriendsCharacter)
        }
         print(myFriendsCharacter)
        return myFriendsCharacter.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! MyFriendsCell
      //  let friend = myFriendsCharacter[indexPath.row]
        //cell.friendName.text = friend
        if searchActive {
            myFriendsCharacter = filteredFriends.filter {$0[$0.startIndex] == Character(characters[indexPath.section]) }
            cell.friendName.text = myFriendsCharacter[indexPath.row]
        } else { myFriendsCharacter = myFriends.filter {$0[$0.startIndex] == Character(characters[indexPath.section]) }
            cell.friendName.text = myFriendsCharacter[indexPath.row]}
        cell.layer.backgroundColor = UIColor.clear.cgColor
        if let nameAvatar = fotoMyFriends[(cell.friendName.text)!]?.last {

            cell.fotoFriend.backgroundColor = UIColor.clear
            cell.fotoFriend.layer.shadowColor = UIColor.black.cgColor
            cell.fotoFriend.layer.shadowOffset = cell.shadowOffset
            cell.fotoFriend.layer.shadowOpacity = cell.shadowOpacity
            cell.fotoFriend.layer.shadowRadius = cell.shadowRadius
            cell.fotoFriend.layer.masksToBounds = false
            
            // add subview
            let borderView = UIView(frame: cell.fotoFriend.bounds)
            borderView.frame = cell.fotoFriend.bounds
            borderView.layer.cornerRadius = 25
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
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return String(characters[section])
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = tableView.backgroundColor
        headerView.alpha = 0.5
        let label = UILabel(frame: CGRect(x: 20, y: 8, width: 20, height: 20))
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17.0)
        label.text = characters[section]
        headerView.addSubview(label)
        return headerView
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




