//
//  ASThemeM.swift
//  Example
//
//  Created by alberto.scampini on 24/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation
import UIKit

class ASThemeVM : NSObject {
    
    var headerColor = Dynamic(UIColor(red:0.91, green:0.32, blue:0.31, alpha:1.00))
    var headerTextColor = Dynamic(UIColor.whiteColor())
    var bodyBackgroundColor = Dynamic(UIColor.whiteColor())
    var bodyHeaderColor = Dynamic(UIColor(red:0.84, green:0.84, blue:0.86, alpha:1.00))
    var bodyHeaderTextColor = Dynamic(UIColor.blackColor())
    var bodyMonthTitleColor = Dynamic(UIColor(red:0.91, green:0.32, blue:0.31, alpha:1.00))
    var bodyDayActiveTextColor = Dynamic(UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.00))
    var bodyDayInactiveTextColor = Dynamic(UIColor(red:0.44, green:0.44, blue:0.44, alpha:1.00))
    var bodySelectionColor = Dynamic(UIColor(red:0.91, green:0.32, blue:0.31, alpha:1.00))
    
    override init() {
        super.init()
    }
    
}