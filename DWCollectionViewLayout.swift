//
//  DWCollectionViewLayout.swift
//  XProject
//
//  Created by Di Wang on 2017/8/23.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit

import UIKit

public let horizonallyPadding:CGFloat = 10
public let verticallyPadding:CGFloat = 10

public let screenWidth = UIScreen.main.bounds.size.width
public let screenHeight = UIScreen.main.bounds.size.height

public let cellWidth:CGFloat = 292
private let cellHeight:CGFloat = 100

private let SpringFactor:CGFloat = 10.0

class DWCollectionViewLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        itemSize = CGSize(width: cellWidth, height: cellHeight)
        headerReferenceSize = CGSize(width: screenWidth, height: verticallyPadding)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        itemSize = CGSize(width: cellWidth, height: cellHeight)
        headerReferenceSize = CGSize(width: screenWidth, height: verticallyPadding)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let offsetY = self.collectionView!.contentOffset.y
        let attrsArray = super.layoutAttributesForElements(in: rect)
        let collectionViewFrameHeight = self.collectionView!.frame.size.height;
        let collectionViewContentHeight = self.collectionView!.contentSize.height;
        let ScrollViewContentInsetBottom = self.collectionView!.contentInset.bottom;
        let bottomOffset = offsetY + collectionViewFrameHeight - collectionViewContentHeight - ScrollViewContentInsetBottom
        let numOfItems = self.collectionView!.numberOfSections
        
        for attr:UICollectionViewLayoutAttributes in attrsArray! {
            if (attr.representedElementCategory == UICollectionElementCategory.cell) {
                var cellRect = attr.frame;
                if offsetY <= 0 {
                    let distance = fabs(offsetY) / SpringFactor;
                    cellRect.origin.y += offsetY + distance * CGFloat(attr.indexPath.section + 1);
                }else if bottomOffset > 0 {
                    let distance = bottomOffset / SpringFactor;
                    cellRect.origin.y += bottomOffset - distance *
                        CGFloat(numOfItems - attr.indexPath.section)
                }
                attr.frame = cellRect;
            }
        }
        return attrsArray;
    }
}
