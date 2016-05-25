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

    var scrollView : UIScrollView!
    var monthsV = Array<ASMonthV>()
    var headerV : UIView!
    var headerSeparatorV : UIView!
    var headerLabels = Array<UILabel>()
    
    var viewModel: ASBodyVM? {
        didSet {
            self.viewModel?.settingsM.selectedMonth.bindAndFire{
                [unowned self] in
                _ = $0
                self.reloadCell(0)
                self.reloadCell(1)
                self.reloadCell(2)
            }
            self.viewModel?.settingsM.selectedDay.bind {
                [unowned self] in
                _ = $0
                self.reloadCell(1)
            }
        }
    }
    
    var theme : ASThemeVM! {
        didSet {
            theme.bodyBackgroundColor.bindAndFire {
                [unowned self] in
                self.backgroundColor = $0
            }
            theme.bodyHeaderColor.bindAndFire {
                [unowned self] in
                self.headerV.backgroundColor = $0
            }
            theme.bodyHeaderTextColor.bindAndFire {
                [unowned self] (color) in
                self.headerLabels.forEach({ (label) in
                    label.textColor = color
                })
            }
            theme.bodyHeaderSeparatorColor.bindAndFire {
                [unowned self] in
                self.headerSeparatorV.backgroundColor = $0
            }
            theme.bodyHeaderTextFont.bindAndFire {
                [unowned self] (font) in
                self.headerLabels.forEach({ (label) in
                    label.font = font
                })
            }
            //set theme vm to month views
            monthsV.forEach { (monthV) in
                monthV.theme = theme
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
        //add scrollview ans calendar
        scrollView = UIScrollView(frame: self.bounds)
        scrollView.delegate = self
        scrollView.setContentOffset(CGPointMake(0, frame.height), animated: false)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.pagingEnabled = true
        self.addSubview(scrollView)
        self.createMonthBoxes(frame.width, height: frame.height)
        //add header
        headerV = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 30))
        headerV.backgroundColor = UIColor.grayColor()
        self.addSubview(headerV)
        //show day names label to header
        let dayLabelW = frame.width / 7
        let weekNames = self.getWeekNames()
        for i in 0...6 {
            let dayLabel = UILabel(frame: CGRect(x: CGFloat(i) * dayLabelW, y: 0, width: dayLabelW, height: 30))
            dayLabel.text = weekNames[i]
            dayLabel.textAlignment = .Center
            headerLabels.append(dayLabel)
            headerV.addSubview(dayLabel)
        }
        //add separator to header
        headerSeparatorV = UIView(frame: CGRect(x: 0, y: 29, width: frame.width, height: 1))
        headerV.addSubview(headerSeparatorV)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
            let cell = self.monthsV[index]
            if (cell.viewModel == nil) {
                let viewModel = self.viewModel!.getViewModelForRow(index, currentViewModel: nil)
                cell.viewModel = viewModel
            } else {
                self.viewModel!.getViewModelForRow(index, currentViewModel: cell.viewModel)
            }
        }
    }
    
    internal func createMonthBoxes(width : CGFloat, height : CGFloat) {
        for i in 0..<3 {
            let monthV =  ASMonthV.init(frame: CGRectMake(0, height * CGFloat(i), width, height))
            scrollView.addSubview(monthV)
            monthsV.append(monthV)
        }
        self.scrollView.contentSize = CGSize(width: width, height: height * 3)
    }
    
}
