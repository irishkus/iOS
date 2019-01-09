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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foto = fotoDelegate
    }

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
        let foto = fotoDelegate[indexPath.row]
        cell.allFoto.image = UIImage(named: foto)
        return cell
    }

}
