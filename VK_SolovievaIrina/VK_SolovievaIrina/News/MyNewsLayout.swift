//
//  MyNewsLayout.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 19.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

protocol MyNewsLayoutDelegate: class {
    func ratio(forItemAt indexPath: IndexPath) -> CGFloat
}

class MyNewsLayout: UICollectionViewLayout {
    
    weak var delegate: MyNewsLayoutDelegate?
        // Хранит атрибуты для заданных индексов
    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()

    
    override func prepare() {
        super.prepare()
        // Проверяем налачие collectionView
        self.cacheAttributes = [:]
        guard let collectionView = self.collectionView else {  return }
        let delegate = self.delegate!
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        // Проверяем, что в секции есть хотя бы одна ячейка
        guard itemsCount > 0 else { return }
        
        
        var firstColumnHeight: CGFloat = 0.0
        var secondColumnHeight: CGFloat = 0.0
        var allAtributes: [IndexPath: UICollectionViewLayoutAttributes] = [:]
        
        if itemsCount > 1 {
        for index in 0..<itemsCount {
            let cellWidth = collectionView.frame.width/2
            let indexPath = IndexPath(item: index, section: 0)
            let ratio = delegate.ratio(forItemAt: indexPath)
            let cellHeight = cellWidth/ratio
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            let isFirstColumn = firstColumnHeight <= secondColumnHeight
            let x = isFirstColumn ? 0.0 : cellWidth
            let y = isFirstColumn ? firstColumnHeight : secondColumnHeight
            attributes.frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
            allAtributes[indexPath] = attributes
            if isFirstColumn {
                firstColumnHeight += cellHeight
            } else {secondColumnHeight += cellHeight}
        }
        } else {let cellWidth = collectionView.frame.width
            let indexPath = IndexPath(item: 0, section: 0)
            let ratio = delegate.ratio(forItemAt: indexPath)
            let cellHeight = cellWidth/ratio
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = CGRect(x: 0, y: 0, width: cellWidth, height: cellHeight)
            allAtributes[indexPath] = attributes
        }
        self.cacheAttributes = allAtributes
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
        var maxX:CGFloat = 0.0
        var maxY: CGFloat = 0.0
        for attribute in self.cacheAttributes.values {
            if maxX < attribute.frame.maxX {
                maxX = attribute.frame.maxX
            }
            if maxY < attribute.frame.maxY {
                maxY = attribute.frame.maxY
            }
        }
        print(maxX)
        print(maxY)
        return CGSize(width: maxX, height: maxY)
    }


}
