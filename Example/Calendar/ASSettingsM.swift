//
//  ASSettingsM.swift
//  Example
//
//  Created by alberto.scampini on 20/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

enum BodySelectionStyle {
    case Week
    case Day
}

class ASSettingsM : NSObject {
    
    //current month viewing
    var selectionStyle : Dynamic<BodySelectionStyle>!
    var selectedMonth : Dynamic<(month : Int, year: Int)>!
    //current selection
    var selectedDay : Dynamic<ASDayM>!
    //interval of available selections
    var firstSelectableDate : Dynamic<(day : Int, month : Int, year: Int)>!
    var lastSelectableDate : Dynamic<(day : Int, month : Int, year: Int)>!
    //other settings
    var startByMonday = Dynamic(true)
    
    init(month : Int, year : Int) {
        super.init()
        self.selectedMonth = Dynamic((month : month, year: year))
        self.selectionStyle = Dynamic(.Day)
        self.selectedDay = Dynamic(ASDayM())//no selection
        let start = (day : 1, month : 1, year: year - 1000)
        self.firstSelectableDate = Dynamic(start)
        let end = (day : 1, month : 1, year: year + 1000)
        self.lastSelectableDate = Dynamic(end)
    }
}