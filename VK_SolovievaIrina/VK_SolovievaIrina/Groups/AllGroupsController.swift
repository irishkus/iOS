//
//  AllGroupsController.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 25.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit
//
//extension AllGroupsController: UISearchResultsUpdating {
//    // MARK: - UISearchResultsUpdating Delegate
//    func updateSearchResults(for searchController: UISearchController) {
//        // TODO
//    }
//}


class AllGroupsController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)
    var allGroups = ["Абстракция", "Новый год", "Цветы", "Любовь", "Котики", "Собачки", "Кролики"]
    var allGroupsFoto = ["Абстракция": "line", "Новый год": "fir", "Цветы": "rose", "Любовь": "heart", "Котики": "red", "Собачки": "green", "Кролики": "orange"]
    var filteredGroup: [String] = []
    var searchActive : Bool = false


    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filteredGroup = allGroups.filter({(text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
            })
            searchActive = true
            tableView.reloadData()}
        else {
            searchActive = false
            tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchActive = false
        tableView.reloadData()
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroupsFoto.count;
    }
    


    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchActive {
            return filteredGroup.count
        } else {
        return allGroups.count
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupCell", for: indexPath) as! AllGroupsCell
        if searchActive {
            cell.allGroupName.text = filteredGroup[indexPath.row]
        } else { cell.allGroupName.text = allGroups[indexPath.row]}
        if let nameAvatar = allGroupsFoto[allGroups[indexPath.row]] {
            cell.allGroupFoto.backgroundColor = UIColor.clear
            cell.allGroupFoto.layer.shadowColor = UIColor.black.cgColor
            cell.allGroupFoto.layer.shadowOffset = cell.shadowOffset
            cell.allGroupFoto.layer.shadowOpacity = cell.shadowOpacity
            cell.allGroupFoto.layer.shadowRadius = cell.shadowRadius
            cell.allGroupFoto.layer.masksToBounds = false
            
            // add subview
            let borderView = UIView(frame: cell.allGroupFoto.bounds)
            borderView.frame = cell.allGroupFoto.bounds
            borderView.layer.cornerRadius = 25
            borderView.layer.masksToBounds = true
            cell.allGroupFoto.addSubview(borderView)
            
            // add subcontent
            let photo = UIImageView()
            photo.image = UIImage(named: nameAvatar)
            photo.frame = borderView.bounds
            borderView.addSubview(photo)
        }
        
        return cell
    }

}

