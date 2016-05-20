//
//  ASMonthBoxV.swift
//  Example
//
//  Created by alberto.scampini on 20/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import UIKit

class ASMonthBoxV : UIView {
    
    var view: ASMonthV!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainViewInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func mainViewInit() {
        //load mainView from xib
        let subviewArray = NSBundle.mainBundle().loadNibNamed("ASMonthV", owner: self, options: nil)
        self.view = subviewArray.first as! ASMonthV
        self.addSubview(view)
        //add layout to mainView
        view.translatesAutoresizingMaskIntoConstraints = false
        let selfTop = NSLayoutConstraint(item: view,
                                         attribute: .Top,
                                         relatedBy: .Equal,
                                         toItem: self,
                                         attribute: .Top,
                                         multiplier: 1,
                                         constant: 0)
        let selfBottom = NSLayoutConstraint(item: view,
                                            attribute: .Bottom,
                                            relatedBy: .Equal,
                                            toItem: self,
                                            attribute: .Bottom,
                                            multiplier: 1,
                                            constant: 0)
        let selfLeft = NSLayoutConstraint(item: view,
                                          attribute: .Left,
                                          relatedBy: .Equal,
                                          toItem: self,
                                          attribute: .Left,
                                          multiplier: 1,
                                          constant: 0)
        let selfRight = NSLayoutConstraint(item: view,
                                           attribute: .Right,
                                           relatedBy: .Equal,
                                           toItem: self,
                                           attribute: .Right,
                                           multiplier: 1,
                                           constant: 0)
        self.addConstraints([selfTop, selfBottom, selfLeft, selfRight])
    }
    
}
