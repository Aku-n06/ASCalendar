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
UIScrollViewDelegate,
ASCalendarNamesM {

    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var dayLabel : Array<UILabel>!
    var currentIndex = 100
    
    var viewModel: ASBodyVM? {
        didSet {
            self.reloadCell(middleIndexPath)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //show day names label
        let weekNames = self.getWeekNames()
        for i in 0...6 {
            self.dayLabel[i].text = weekNames[i]
        }
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
        self.collectionView.registerNib(
            UINib(nibName: "ASMonthCellV", bundle: nil),
            forCellWithReuseIdentifier: "Cell"
        )
        self.collectionView.collectionViewLayout = collapsedLayout
        self.collectionView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
    }
    
    //MARK: public methods
    
    func showMonth(month : Int, year : Int) {
        self.viewModel?.selectedMonth.value = (month : month, year : year)
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
        if (self.viewModel != nil) {
            let offset = self.viewModel!.calculateMonthOffset(indexPath.row)
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
            self.viewModel?.switchMonth(false)
            self.reloadCell(previusIndexPath)
            self.reloadCell(middleIndexPath)
            scrollView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
        } else if (scrollView.contentOffset.y >= self.frame.height * 2) {
            self.viewModel?.switchMonth(true)
            self.reloadCell(nextIndexPath)
            self.reloadCell(middleIndexPath)
            scrollView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
        }
    }
    
    //MARK: private methods
    
    internal func reloadCell(indexPath : NSIndexPath) {
        if (self.viewModel != nil) {
            let cell = self.collectionView.cellForItemAtIndexPath(indexPath) as? ASMonthCellV
            let offset = self.viewModel!.calculateMonthOffset(indexPath.row)
            let month = ASMonthM(month: offset.month, year: offset.year)
            cell?.populate(month)
        }
    }
    
}
