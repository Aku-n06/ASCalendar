//
//  ASBodyV.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

//  Recursive collectionview to show the month days
//  each cell is a month

import UIKit

class ASBodyV:
UIView,
UICollectionViewDataSource,
UICollectionViewDelegate,
UIScrollViewDelegate {

    @IBOutlet var collectionView : UICollectionView!
    var currentIndex = 100
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        //horizontal layout without spacing
        let collapsedLayout = UICollectionViewFlowLayout()
        collapsedLayout.itemSize = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        collapsedLayout.scrollDirection = .Vertical
        collapsedLayout.minimumInteritemSpacing = 0
        collapsedLayout.minimumLineSpacing = 0
        //setup collection view
        self.collectionView.pagingEnabled = true
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.registerNib(UINib(nibName: "ASMonthCellV", bundle: nil), forCellWithReuseIdentifier: "Cell")
        self.collectionView.collectionViewLayout = collapsedLayout
    }
    
    //MARK: collectionView dataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(
        collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath
        ) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
            "Cell",
            forIndexPath: indexPath
        ) as! ASMonthCellV
        
        if (indexPath.row == 0) {
            self.currentIndex -= 1
        } else if (indexPath.row == 2) {
            self.currentIndex += 1
        }
        
        (cell.viewWithTag(9) as! UILabel).text = String(self.currentIndex)
        return cell
    }
    
    //MARK: scrollView delegate
    
    var middleIndexPath = NSIndexPath(forItem: 1, inSection: 0)
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if (scrollView.contentOffset.y <= 0) {
            self.reloadMiddleCell()
            scrollView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
        } else if (scrollView.contentOffset.y >= self.frame.height * 2) {
            self.reloadMiddleCell()
            scrollView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
        }
    }
    
    //MARK: private methods
    
    internal func reloadMiddleCell() {
        let cell = self.collectionView.cellForItemAtIndexPath(middleIndexPath) as! ASMonthCellV
        (cell.viewWithTag(9) as! UILabel).text = String(self.currentIndex)
    }
}
