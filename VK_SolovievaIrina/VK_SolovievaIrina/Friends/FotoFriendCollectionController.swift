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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FotoCell", for: indexPath) as! FotoCollectionCell
        cell.backgroundColor = .black
        print(cell)
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.01,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        cell.frame = CGRect(x: 0, y: 0, width: 120, height: 70)
                        cell.frame.size.height -= 40
                        cell.frame.size.width -= 40
                        cell.allFoto.frame.size.height -= 20
                        cell.allFoto.frame.size.width -= 20
        })
    }
}
