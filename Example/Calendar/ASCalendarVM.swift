//
//  ASBodyVM.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

class ASCalendarVM: NSObject{
    
    var selectedMonth: Dynamic<(month : Int, year : Int)>!
    
    init(month : Int, year : Int) {
        super.init()
        selectedMonth = Dynamic(month : month, year : year)
    }
    
}
