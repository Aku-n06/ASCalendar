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
    
    var bodyV : ASBodyV!
    var headerLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //add calendar header label
        headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 40))
        headerLabel.backgroundColor = UIColor.redColor()
        headerLabel.textColor = UIColor.whiteColor()
        headerLabel.textAlignment = .Center
        headerLabel.text = "CALENDAR"
        self.addSubview(headerLabel)
        //add calendar body
        bodyV = ASBodyV(frame: CGRect(x: 0, y: 40, width: 250, height: 210))
        self.addSubview(bodyV)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var viewModel: ASCalendarVM! {
        didSet {
            viewModel.headerString.bindAndFire {
                [unowned self] in
                self.headerLabel.text = $0
            }
            self.bodyV.viewModel = viewModel.bodyVM
        }
    }
    
}