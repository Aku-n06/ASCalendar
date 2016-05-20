//
//  ASBodyVM.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

class ASCalendarVM: NSObject, ASCalendarNamesM {
    
    var selectedMonth: Dynamic<(month : Int, year : Int)>!
    var calendarSettings : Dynamic<ASSettingsM>!
    var headerString : Dynamic<String>!
    
    var bodyVM : ASBodyVM!
    
    init(month : Int, year : Int, settings : ASSettingsM) {
        super.init()
        selectedMonth = Dynamic(month : month, year : year)
        self.calendarSettings = Dynamic(settings)
        self.headerString = Dynamic("")
        //setup body viewModel
        self.bodyVM = ASBodyVM(
            month: self.selectedMonth.value.month,
            year: self.selectedMonth.value.year
        )
        //bound to bodyVM
        self.bodyVM.selectedMonth.bindAndFire {
            [unowned self] in
            self.headerString.value = self.getMonthNames()[$0.month - 1] + " " + String($0.year)
        }
    }
    
}
