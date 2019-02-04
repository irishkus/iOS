//
//  MyNewsCell.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 07.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

class MyNewsCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate,  MyNewsLayoutDelegate {
    
    var allFotoNews = [String]()

    
    private func image(at indexPath: IndexPath) -> UIImage {
        return UIImage(named: allFotoNews[indexPath.row])!
    }
 
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFotoNews.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsFotoCell", for: indexPath) as! MyNewsColCell
        cell.imageNews.image = self.image(at: indexPath)
        return cell
    }
    
    func ratio (forItemAt indexPath: IndexPath) -> CGFloat {
        let image = self.image(at: indexPath)
        return image.size.width/image.size.height
    }

    @IBOutlet weak var fotoNews: UICollectionView! 
    @IBOutlet weak var sumViewNews: UILabel!
    @IBOutlet weak var sumShareNews: UILabel!
    @IBOutlet weak var sumCommentNews: UILabel!
    @IBOutlet weak var textNews: UILabel!
    @IBOutlet weak var groupNewsName: UILabel!
    @IBOutlet weak var groupNewsFoto: UIImageView!
    @IBOutlet weak var likeCell: LikeControl!

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3)
    
    // Прозрачность тени
    @IBInspectable var shadowOpacity: Float = 0.3

    /// Радиус блура тени
    @IBInspectable var shadowRadius: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let customSuperLayout = MyNewsLayout()
        customSuperLayout.delegate = self
        fotoNews.setCollectionViewLayout(customSuperLayout, animated: false)
        fotoNews.dataSource = self
        fotoNews.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

