//
//  GridCVLayout.swift
//  TuneinLife
//
//  Created by Kanchan on 23/01/17.
//  Copyright © 2017 Shyatoria. All rights reserved.
//

import UIKit

protocol GridLayoutDelegate {
    // 1
    func collectionView(collectionView:UICollectionView, heightForGoalImageAtIndexPath indexPath:IndexPath,
                        withWidth width:CGFloat) -> CGFloat
    // 2
    func collectionView(collectionView: UICollectionView,
                        heightForGoalDetailsAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat
}


class GridCVLayout: UICollectionViewLayout {

    var delegate : GridLayoutDelegate!
    var numberOfColumns = 2
    var cellPadding : CGFloat = 5.0
    private var cache = [UICollectionViewLayoutAttributes]()
    private var contentHeight : CGFloat = 0.0
    private var contentWidth :CGFloat {
    
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
        
    }
    
    override func prepare() {
        //1
        if cache.isEmpty {
            //2
            let columnWidth = contentWidth / CGFloat(numberOfColumns)
            var xOffset = [CGFloat]()
            for column in 0 ..< numberOfColumns {
            
                xOffset.append(CGFloat(column) * columnWidth)
                
            }
            var column = 0
            var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
            //3
            for item in 0 ..< collectionView!.numberOfItems(inSection : 0 ){
            
                let indexPath = IndexPath(item: item, section: 0)
               //4
                let width = columnWidth - cellPadding * 2
                let goalImageHeight = delegate.collectionView(collectionView: collectionView!, heightForGoalImageAtIndexPath: indexPath as IndexPath, withWidth: width)
                
                let goalDetailsHeight = delegate.collectionView(collectionView: collectionView!, heightForGoalDetailsAtIndexPath: indexPath as IndexPath, withWidth: width)
                
                let height = cellPadding + goalImageHeight + goalDetailsHeight + cellPadding
                
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                //5
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
                attributes.frame = insetFrame
                cache.append(attributes)
                
                //6
                contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + height
                column = column >= (numberOfColumns - 1) ? 0 : column + 1
                
            }
            
        }
    }
    
    override var collectionViewContentSize : CGSize {
       
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
    
}
