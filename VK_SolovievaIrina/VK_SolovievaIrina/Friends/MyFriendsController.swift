//
//  MyFriends.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 22.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit



@IBDesignable class MyFriendsController: UITableViewController {
    
    var fotoDelegate = [String]()
    
    class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3)
    
    /// Прозрачность тени
    @IBInspectable var shadowOpacity: Float = 0.3
    
    /// Радиус блура тени
    @IBInspectable var shadowRadius: CGFloat = 10 {
        didSet {
        self.updateFocusIfNeeded()
        }
    }
    
    /// Цвет тени
//    @IBInspectable var shadowColor: UIColor? {
//        set { tableView.layer.shadowColor = newValue?.cgColor }
//        get { return tableView.layer.shadowColor?.cgColor }
//    }
    
//    @IBInspectable var shadowRadius: CGFloat {
//         set { tableView.layer.shadowRadius = newValue }
//         get { return tableView.layer.shadowRadius }
//    }

    var myFriends = ["Иван Иванов", "Петр Петров", "Сидор Сидоров"]
    var fotoMyFriends = ["Иван Иванов": ["vk_logo","yellow", "red", "rose"], "Петр Петров": ["friend","green", "fir", "line"], "Сидор Сидоров": ["groups","orange", "blue", "heart"]]    
    

//    class ImageWithShadow: UIImageView {
//        
//        override func draw(_ rect: CGRect) {
//            updateLayerProperties()
//        }
//        
//        func updateLayerProperties() {
//            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//            self.layer.shadowOffset = CGSize(width: 0, height: 2)
//            self.layer.shadowOpacity = 0.5
//            self.layer.shadowRadius = 8.0
//            self.layer.masksToBounds = false
//        }
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
            cell.fotoFriend.layer.shadowOffset = shadowOffset
            cell.fotoFriend.layer.shadowOpacity = shadowOpacity
            cell.fotoFriend.layer.shadowRadius = shadowRadius
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
                    print(fotoFriendsController.fotoDelegate)
                }
            }
        }
    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}


//extension MyFriendsController {
//    @IBInspectable var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//            layer.masksToBounds = newValue > 0
//        }
//    }
//}


