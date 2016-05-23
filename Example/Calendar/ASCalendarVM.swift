//
//  ASBodyVM.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

class ASCalendarVM: NSObject, ASCalendarNamesM {
    
    var calendarSettings : Dynamic<ASSettingsM>!
    var headerString : Dynamic<String>!
    
    var bodyVM : ASBodyVM!
    var settingM : ASSettingsM!
    
    init(settings : ASSettingsM) {
        super.init()
        self.calendarSettings = Dynamic(settings)
        self.headerString = Dynamic("")
        self.settingM = settings
        //bound to settings
        self.settingM.selectedMonth.bindAndFire{
            [unowned self] in
            self.headerString.value = self.getMonthNames()[$0.month - 1] + " " + String($0.year)
        }
        //create BodyVM
        self.bodyVM = ASBodyVM(settings: settings)
    }

    
}
