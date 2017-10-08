//
//  DWViewController.swift
//  XProject
//
//  Created by Di Wang on 2017/8/23.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit

let cellId = "Cell"

class DWViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    let images = [#imageLiteral(resourceName: "7"),#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "8"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "9"),#imageLiteral(resourceName: "5"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "6"),#imageLiteral(resourceName: "2")]
    let selectedCell = CollectionViewCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.contentInset = UIEdgeInsets(
            top: 0,
            left: 60,
            bottom: 0,
            right: 0
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        cell.layer.cornerRadius = 10
        let image = images[indexPath.item]
        cell.imageView.image = image
        cell.imageView.layer.cornerRadius = 10
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    
}
