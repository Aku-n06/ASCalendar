//
//  ASMonthVM.swift
//  Example
//
//  Created by alberto.scampini on 20/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

class ASMonthVM : NSObject {
    
    var settingsM : ASSettingsM!
    var monthM : Dynamic<ASMonthM>!
    
    init(settings : ASSettingsM, monthM : ASMonthM) {
        super.init()
        self.settingsM = settings
        self.monthM = Dynamic(monthM)
    }
    
    //MARK: public Methods
    
    func getWeekModel(week : ASWeekM, currentViewModel : ASWeekVM?) -> ASWeekVM?{
        if (currentViewModel != nil) {
            currentViewModel!.weekM.value = week
            return nil
        }
        return ASWeekVM(settings: self.settingsM, weekM: week)
    }
    
}