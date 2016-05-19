//
//  ASMonthCellV.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import UIKit

class ASMonthCellV: UICollectionViewCell {
    
    @IBOutlet var rowsV : Array<ASMonthRowV>!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.redColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: public methods
    
    func populate(month : ASMonthM) {
        for i in 0..<rowsV.count {
            print(i)
            //show or hide week
            rowsV[i].hidden = false
            if (i >= month.weeks.count) {
                rowsV[i].hidden = true
            } else {
                rowsV[i].view.populate(month.weeks[i])
            }
        }
    }
    
}
