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
UIScrollViewDelegate,
ASCalendarNamesM {

    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var monthBoxesViews : Array<ASMonthBoxV>!
    @IBOutlet var dayLabel : Array<UILabel>!
    var currentIndex = 100
    
    var viewModel: ASBodyVM? {
        didSet {
            self.viewModel?.settingsM.selectedMonth.bindAndFire{
                [unowned self] in
                _ = $0
                
                self.reloadCell(0)
                self.reloadCell(1)
                self.reloadCell(2)
            }
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
        self.scrollView.delegate = self
        self.scrollView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
        self.scrollView.pagingEnabled = true
    }

    
    //MARK: scrollView delegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if (scrollView.contentOffset.y <= 0) {
            self.viewModel?.switchMonth(false)
            scrollView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
        } else if (scrollView.contentOffset.y >= self.frame.height * 2) {
            self.viewModel?.switchMonth(true)
            scrollView.setContentOffset(CGPointMake(0, self.frame.height), animated: false)
        }
    }
    
    //MARK: private methods
    
    internal func reloadCell(index : Int) {
        if (self.viewModel != nil) {
            let cell = self.monthBoxesViews[index].view
            if (cell.viewModel == nil) {
                
                let viewModel = self.viewModel!.getViewModelForRow(index, currentViewModel: nil)
                cell.viewModel = viewModel
            } else {
                self.viewModel!.getViewModelForRow(index, currentViewModel: cell.viewModel)
            }
        }
    }
    
}
