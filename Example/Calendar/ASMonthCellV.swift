//
//  ASMonthCellV.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import UIKit

class ASMonthCellV: UICollectionViewCell, ASCalendarNamesM {
    
    @IBOutlet var rowsV : Array<ASMonthRowV>!
    @IBOutlet var rowsHeights : Array<NSLayoutConstraint>!
    @IBOutlet var monthLabel : UILabel!
    var viewModel : ASMonthCellVM! {
        didSet {
            self.viewModel.monthM.bindAndFire{
                [unowned self] in
                //populate
                self.monthLabel.text = self.getMonthNames()[$0.month-1].uppercaseString
                for i in 0..<self.rowsV.count {
                    //show or hide week
                    self.rowsV[i].hidden = false
                    self.rowsHeights[i].constant = 1000
                    if (i >= $0.weeks.count) {
                        self.rowsV[i].hidden = true
                        self.rowsHeights[i].constant = 0
                    } else {
                        self.rowsV[i].view.populate($0.weeks[i])
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
