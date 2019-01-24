//
//  MyNewsLayout.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 19.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

class MyNewsLayout: UICollectionViewLayout {
    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    // Хранит атрибуты для заданных индексов
    
    var columnsCount = 2                  // Количество столбцов
    
    var cellHeight: CGFloat = 128         // Высота ячейки
    
    private var totalCellsHeight: CGFloat = 0 // Хранит суммарную высоту всех ячеек
    
    override func prepare() {
        super.prepare()
        // Проверяем налачие collectionView
        self.cacheAttributes = [:]
        guard let collectionView = self.collectionView else { return }
        
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        // Проверяем, что в секции есть хотя бы одна ячейка
        guard itemsCount > 0 else { return }
        
        let cellWidth = collectionView.frame.width
        let cellHeight = collectionView.frame.height
        
        for index in 0..<itemsCount {
            let indexPath = IndexPath(item: index, section: 0)
            //  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyNews", for: indexPath) as! MyNewsCollectionViewCell
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = CGRect(x: 0, y: 0, width: cellWidth/2, height: cellHeight/2)
            cacheAttributes[indexPath] = attributes
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        return cacheAttributes.values.filter {attributes in
            return rect.intersects(attributes.frame)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath]
    }
    
    override var collectionViewContentSize: CGSize {
      //  return CGSize(width: self.collectionView?.frame.width ?? 0,
                   //   height: self.totalCellsHeight)
        return CGSize(width: 100,
           height: 100)
    }

}
