//
//  FotoFriendCollectionController.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 22.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit

class FotoFriendCollectionController: UICollectionViewController {
    var fotoDelegate: [String] = []
    var foto: [String] = []
//    @IBAction func allFoto(segue: UIStoryboardSegue) {
//        // Проверяем идентификатор, чтобы убедится, что это нужный переход
//        if segue.identifier == "allFotoFriend" {
//            // Получаем ссылку на контроллер, с которого осуществлен переход
//            let myFriendsController = segue.source as! MyFriendsController
//            
//            // Получаем индекс выделенной ячейки
//            if let indexPath = myFriendsController.tableView.indexPathForSelectedRow {
//                // Получаем город по индексу
//                let friend = myFriendsController.myFriends[indexPath.row]
//                fotoDelegate = myFriendsController.fotoMyFriends[friend] as! [String]
//            }
//            
//        }
//        
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "allFotoFriend" {
//            // Получаем ссылку на контроллер, с которого осуществлен переход
//            let myFriendsController = segue.source as! MyFriendsController
//
//            // Получаем индекс выделенной ячейки
//            if let indexPath = myFriendsController.tableView.indexPathForSelectedRow {
//                // Получаем город по индексу
//                let friend = myFriendsController.myFriends[indexPath.row]
//                fotoDelegate = myFriendsController.fotoMyFriends[friend] as! [String]
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foto = fotoDelegate
        print("Фото")
        print(foto.count)
//        print(deleg.fotoMyFriends.count)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return foto.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FotoCell", for: indexPath) as! FotoCollectionCell
        // Устанавливаем город в надпись ячейки
        let foto = fotoDelegate[indexPath.row]
        print(foto)
        cell.allFoto.image = UIImage(named: foto)

        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
