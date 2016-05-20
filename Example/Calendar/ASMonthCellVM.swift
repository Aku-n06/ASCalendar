//
//  ASMonthCellVM.swift
//  Example
//
//  Created by alberto.scampini on 20/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

class ASMonthCellVM : NSObject {
    
    var settingsM : ASSettingsM!
    var monthM : Dynamic<ASMonthM>!
    
    init(settings : ASSettingsM, monthM : ASMonthM) {
        super.init()
        self.settingsM = settings
        self.monthM = Dynamic(monthM)
        self.settingsM.selectedDay.bindAndFire {
            [unowned self] in
            if ($0.month == self.monthM.value.month && $0.year == self.monthM.value.year) {
                print("this")
            }
        }
    }
    
    //MARK: public Methods
    
    func getWeekModel(week : ASWeekM) -> ASWeekVM{
        return ASWeekVM(settings: self.settingsM, weekM: week)
    }
    
}