//
//  ASMonthV.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import UIKit

class ASMonthV: UIView, ASCalendarNamesM {
    
    var rowsV = Array<ASWeekV>()
    var monthLabel : UILabel!
    var separatorV : UIView!
    var viewModel : ASMonthVM! {
        didSet {
            self.viewModel.monthM.bindAndFire{
                [unowned self] in
                //populate
                self.monthLabel.text = self.getMonthNames()[$0.month-1].uppercaseString
                for i in 0..<self.rowsV.count {
                    //show or hide week
                    self.rowsV[i].hidden = false
                    if (i >= $0.weeks.count) {
                        self.rowsV[i].hidden = true
                    } else {
                        if (self.rowsV[i].viewModel == nil) {
                            self.rowsV[i].viewModel = self.viewModel.getWeekModel($0.weeks[i], currentViewModel: nil)
                        } else {
                            self.viewModel.getWeekModel($0.weeks[i], currentViewModel: self.rowsV[i].viewModel)
                        }
                    }
                }
                self.layoutViews()
            }
        }
    }
    
    var theme : ASThemeVM! {
        didSet {
            theme.bodyMonthTitleColor.bindAndFire {
                [unowned self] in
                self.monthLabel.textColor = $0
            }
            theme.bodySeparatorColor.bindAndFire {
                [unowned self] in
                self.separatorV.backgroundColor = $0
            }
            rowsV.forEach { (rowV) in
                rowV.theme = theme
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //add separator
        separatorV = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 1))
        self.addSubview(separatorV)
        //add month label
        monthLabel = UILabel(frame: CGRect(x: 10, y: 0, width: frame.width - 20, height: 30))
        monthLabel.textColor = UIColor.redColor()
        self.addSubview(monthLabel)
        //add rows
        let rowH = (frame.height - 30) / 6
        super.awakeFromNib()
        for i in 0..<6 {
            let rowV = ASWeekV(frame: CGRect(x: 0, y: rowH * CGFloat(i) + 30, width: frame.width, height: rowH))
            self.addSubview(rowV)
            self.rowsV.append(rowV)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: private methods
    
    internal func layoutViews() {
        //count active rows
        var rowCount : CGFloat = 0
        rowsV.forEach { (rowV) in
            if (rowV.hidden == false) {
                rowCount += 1
            }
        }
        //resize and place rows
        let rowH = (frame.height - 30) / rowCount
        for i in 0..<6 {
            rowsV[i].frame = CGRect(x: 0, y: rowH * CGFloat(i) + 30, width: frame.width, height: rowH)
            rowsV[i].layoutViews()
        }
    }
    
}
