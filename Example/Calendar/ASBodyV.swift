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
    var currentMonth : Int?
    var currentYear : Int?
    
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
        self.collectionView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
    }
    
    //MARK: public methods
    
    func showMonth(month : Int, year : Int) {
        self.currentMonth = month
        self.currentYear = year
        self.reloadCell(middleIndexPath)
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
        if (self.currentMonth != nil) {
            let offset = calculateMonthOffset(indexPath.row)
            let month = ASMonthM(month: offset.month, year: offset.year)
            cell.populate(month)
        }
        return cell
    }
    
    //MARK: scrollView delegate
    
    var previusIndexPath = NSIndexPath(forItem: 0, inSection: 0)
    var middleIndexPath = NSIndexPath(forItem: 1, inSection: 0)
    var nextIndexPath = NSIndexPath(forItem: 2, inSection: 0)
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if (scrollView.contentOffset.y <= 0) {
            self.switchMonth(false)
            self.reloadCell(previusIndexPath)
            self.reloadCell(middleIndexPath)
            scrollView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
        } else if (scrollView.contentOffset.y >= self.frame.height * 2) {
            self.switchMonth(true)
            self.reloadCell(nextIndexPath)
            self.reloadCell(middleIndexPath)
            scrollView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
        }
    }
    
    //MARK: private methods
    
    internal func reloadCell(indexPath : NSIndexPath) {
        if (self.currentMonth != nil) {
            let cell = self.collectionView.cellForItemAtIndexPath(indexPath) as? ASMonthCellV
            let offset = calculateMonthOffset(indexPath.row)
            let month = ASMonthM(month: offset.month, year: offset.year)
            cell?.populate(month)
        }
    }
    
    internal func switchMonth(increment : Bool) {
        if (self.currentMonth != nil) {
            if (increment == false) {
                //previus month
                self.currentMonth! -= 1
                if (self.currentMonth == 0) {
                    self.currentMonth = 12
                    self.currentYear! -= 1
                }
            } else if (increment == true) {
                //next month
                self.currentMonth! += 1
                if (self.currentMonth == 13) {
                    self.currentMonth = 1
                    self.currentYear! += 1
                }
            }
        }
    }
    
    internal func calculateMonthOffset(row : Int) -> (month: Int, year: Int) {
        var monthOffset = self.currentMonth!
        var yearOffset = self.currentYear!
        let offset = row - 1
        monthOffset = monthOffset + offset
        if (monthOffset == 13) {
            monthOffset = 1
            yearOffset += 1
        }
        else if (monthOffset == 0) {
            monthOffset = 12
            yearOffset -= 1
        }
        return (month: monthOffset, year: yearOffset)
    }
    
}
