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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: public methods
    
    func populate(month : ASMonthM) {
        self.monthLabel.text = self.getMonthNames()[month.month-1].uppercaseString
        for i in 0..<rowsV.count {
            //show or hide week
            rowsV[i].hidden = false
            rowsHeights[i].constant = 1000
            if (i >= month.weeks.count) {
                rowsV[i].hidden = true
                rowsHeights[i].constant = 0
            } else {
                rowsV[i].view.populate(month.weeks[i])
            }
        }
    }
    
    
    
}
