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
    var headerSeparatorV : UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //add calendar header label
        headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 40))
        headerLabel.backgroundColor = UIColor.redColor()
        headerLabel.textColor = UIColor.whiteColor()
        headerLabel.textAlignment = .Center
        headerLabel.text = "CALENDAR"
        self.addSubview(headerLabel)
        //add separator to header
        headerSeparatorV = UIView(frame: CGRect(x: 0, y: 39, width: frame.width, height: 1))
        headerLabel.addSubview(headerSeparatorV)
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
    
    var theme : ASThemeVM! {
        didSet {
            self.bodyV.theme = theme
            theme.headerColor.bindAndFire {
                [unowned self] in
                self.headerLabel.backgroundColor = $0
            }
            theme.headerTextColor.bindAndFire {
                [unowned self] in
                self.headerLabel.textColor = $0
            }
            theme.headerSeparatorColor.bindAndFire {
                [unowned self] in
                self.headerSeparatorV.backgroundColor = $0
            }
            theme.headerTextFont.bindAndFire {
                [unowned self] in
                self.headerLabel.font = $0
            }
        }
    }
    
}
