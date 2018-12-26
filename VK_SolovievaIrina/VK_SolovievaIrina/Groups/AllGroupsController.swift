//
//  AllGroupsController.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 25.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit

extension AllGroupsController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}


class AllGroupsController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var allGroups = ["Абстракция", "Новый год", "Цветы", "Любовь"]
    var allGroupsFoto = ["Абстракция": "line", "Новый год": "fir", "Цветы": "rose", "Любовь": "heart"]
    var filteredGroup: [String] = []


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup the Search Controller
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.placeholder = "Поиск группы"
//        navigationItem.searchController = searchController
//        definesPresentationContext = true
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // MARK: - Private instance methods
    
//    func searchBarIsEmpty() -> Bool {
//        // Returns true if the text is empty or nil
//        return searchController.searchBar.text?.isEmpty ?? true
//    }
    
//    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
//         filteredGroup = allGroupsFoto.filter({( group : allGroupsFoto) -> Bool in
//            return group.name.lowercased().contains(searchText.lowercased())
//        })
//
//        tableView.reloadData()
//    }
  //  эрудит и абвгдейка
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupCell", for: indexPath) as! AllGroupsCell
        let group = allGroups[indexPath.row]
        cell.allGroupName.text = group
        if let nameAvatar = allGroupsFoto[group] {
            cell.allGroupFoto.image = UIImage(named: nameAvatar)
        }

        return cell
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
