//
//  ASCalendarV.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation
import UIKit

class ASCalendarV: UIView, ASCalendarNamesM {
    
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
                //create month ViewModel
                self.bodyV.view.showMonth($0.month, year: $0.year)
            }
            //setup body viewModel
            if (self.bodyV.view.viewModel == nil) {
                self.bodyV.view.viewModel = ASBodyVM(
                    month: viewModel.selectedMonth.value.month,
                    year: viewModel.selectedMonth.value.year
                )
                //bound with bodyV datamodel
                self.bodyV.view.viewModel?.selectedMonth.bindAndFire {
                    [unowned self] in
                    let headerString = self.getMonthNames()[$0.month - 1] + " " + String($0.year)
                    self.headerLabel.text =  headerString.uppercaseString
                }
            }
        }
    }
    
}