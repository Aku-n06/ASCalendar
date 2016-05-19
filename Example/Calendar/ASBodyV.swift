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
        self.reloadMiddleCell()
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
            //calculate month offset for the cell
            var monthOffset = self.currentMonth!
            var yearOffset = self.currentYear!
            let offset = indexPath.row - 1
            monthOffset = monthOffset + offset
            if (monthOffset == 12) {
                monthOffset = 1
                yearOffset += 1
            }
            else if (monthOffset == 0) {
                monthOffset = 12
                yearOffset -= 1
            }
            //create month data
            let month = ASMonthM(month: monthOffset, year: yearOffset)
            cell.populate(month)
        }
        return cell
    }
    
    //MARK: scrollView delegate
    
    var middleIndexPath = NSIndexPath(forItem: 1, inSection: 0)
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if (scrollView.contentOffset.y <= 0) {
            self.switchMonth(false)
            self.reloadMiddleCell()
            scrollView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
        } else if (scrollView.contentOffset.y >= self.frame.height * 2) {
            self.switchMonth(true)
            self.reloadMiddleCell()
            scrollView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
        }
    }
    
    //MARK: private methods
    
    internal func reloadMiddleCell() {
        if (self.currentMonth != nil) {
            let cell = self.collectionView.cellForItemAtIndexPath(middleIndexPath) as? ASMonthCellV
            let month = ASMonthM(month: self.currentMonth!, year: self.currentYear!)
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
                if (self.currentMonth == 12) {
                    self.currentMonth = 1
                    self.currentYear! += 1
                }
            }
        }
    }
    
}
