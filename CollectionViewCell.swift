//
//  CollectionViewCell.swift
//  XProject
//
//  Created by Di Wang on 2017/8/22.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var image: UIImage? {
        didSet {
            if let image = image {
                imageView.image = image
            } else {
                imageView.backgroundColor = .lightGray
            }
        }
    }
}
