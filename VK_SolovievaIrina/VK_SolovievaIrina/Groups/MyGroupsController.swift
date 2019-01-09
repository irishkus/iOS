//
//  MyGroupsController.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 25.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit

class MyGroupsController: UITableViewController {

    @IBAction func addGroup(segue: UIStoryboardSegue) {
        // Проверяем идентификатор, чтобы убедится, что это нужный переход
        if segue.identifier == "addGroup" {
            // Получаем ссылку на контроллер, с которого осуществлен переход
            let allGroupsController = segue.source as! AllGroupsController

            // Получаем индекс выделенной ячейки
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                // Получаем город по индексу
                let group = allGroupsController.allGroups[indexPath.row] 
                let groupFoto = allGroupsController.allGroupsFoto[group]
                // Добавляем город в список выбранных городов
                if !myGroups.contains(group) {
                    myGroups.append(group)
                    //myGroupsFoto.append(group)
                    // Обновляем таблицу
                    myGroupsFoto[group] = groupFoto
                    tableView.reloadData()
                }
            }

        }

    }

    var myGroups = ["Котики", "Собачки", "Кролики"]
    var myGroupsFoto = ["Котики": "red", "Собачки": "green", "Кролики": "orange"]
    
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
        return myGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! MyGroupCell
        let group = myGroups[indexPath.row]
        cell.groupName.text = group
        if let nameAvatar = myGroupsFoto[group] {
            cell.fotoGroup.backgroundColor = UIColor.clear
            cell.fotoGroup.layer.shadowColor = UIColor.black.cgColor
            cell.fotoGroup.layer.shadowOffset = cell.shadowOffset
            cell.fotoGroup.layer.shadowOpacity = cell.shadowOpacity
            cell.fotoGroup.layer.shadowRadius = cell.shadowRadius
            cell.fotoGroup.layer.masksToBounds = false
            
            // add subview
            let borderView = UIView(frame: cell.fotoGroup.bounds)
            borderView.frame = cell.fotoGroup.bounds
            borderView.layer.cornerRadius = 40
            
            borderView.layer.masksToBounds = true
            cell.fotoGroup.addSubview(borderView)
            
            // add subcontent
            let photo = UIImageView()
            photo.image = UIImage(named: nameAvatar)
            photo.frame = borderView.bounds
            borderView.addSubview(photo)
            //cell.fotoGroup.image = UIImage(named: nameAvatar)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем группу из массива
            let keyGroup = myGroups[indexPath.row]
            myGroups.remove(at: indexPath.row)
            myGroupsFoto.removeValue(forKey: keyGroup)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
