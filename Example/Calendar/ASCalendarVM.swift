//
//  ASBodyVM.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

class ASCalendarVM: NSObject{
    
    var month: Dynamic<ASMonthM>!
    
    init(month : ASMonthM) {
        super.init()
        self.month = Dynamic(month)
    }
    
}
