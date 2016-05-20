//
//  ASCalendarV.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation
import UIKit

class ASCalendarV: UIView {
    
    @IBOutlet var bodyV : ASBodyContainerV!
    @IBOutlet var leftBarWidth : NSLayoutConstraint!
    @IBOutlet var rightBarWidth : NSLayoutConstraint!
    @IBOutlet var headerLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //hide lateral bars
        self.leftBarWidth.constant = 0
        self.rightBarWidth.constant = 0
        //show current month - year
        self.headerLabel.text = "CALENDAR"
    }
    
    var viewModel: ASCalendarVM! {
        didSet {
            viewModel.selectedMonth.bind {
                [unowned self] in
                self.bodyV.view.showMonth($0.month, year: $0.year)
            }
            viewModel.calendarSettings.bind {
                let settings = $0
            }
            viewModel.headerString.bindAndFire {
                [unowned self] in
                self.headerLabel.text = $0
            }
            self.bodyV.view.viewModel = viewModel.bodyVM
        }
    }
    
}