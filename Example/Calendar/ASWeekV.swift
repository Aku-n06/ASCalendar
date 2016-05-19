//
//  ASWeekV.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//


import UIKit

class ASWeekV : UIView {
    
    @IBOutlet var boxesV : Array<ASWeekBoxV>!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: public methods
    
    func populate(week : ASWeekM) {
        for i in 0..<7 {
            let day = week.days[i]
            boxesV[i].view.populate(
                day.dayNumber,
                selected: day.daySelected,
                enabled: day.dayEnabled
            )
        }
    }
}