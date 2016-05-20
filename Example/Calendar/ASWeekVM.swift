//
//  ASWeekVM.swift
//  Example
//
//  Created by alberto.scampini on 20/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

class ASWeekVM : NSObject {

    var settingsM : ASSettingsM!
    var weekM : Dynamic<ASWeekM>!
    var selectedIndex : Dynamic<Int>!
        
    init(settings : ASSettingsM, weekM : ASWeekM) {
        super.init()
        self.settingsM = settings
        self.weekM = Dynamic(weekM)
        self.selectedIndex = Dynamic(-1)
        self.weekM.bind {[unowned self] (week) in
            self.checkSelection(self.settingsM.selectedDay.value)
        }
        self.settingsM.selectedDay.bindAndFire { [unowned self] (day) in
            self.checkSelection(day)
        }
    }
    
    //MARK: public methods
    
    func getModelForIndex(index : Int, currentViewModel : ASDayVM?) -> ASDayVM? {
        let day = self.weekM.value.days[index]
        if (currentViewModel != nil) {
            currentViewModel?.dayM.value = day
            return nil
        }
        return ASDayVM(settings: self.settingsM, day: day)
    }
    
    //MARK: private methods
    
    internal func checkSelection(day : ASDayM) {
        if (day.dayYear == self.weekM.value.weekYear && day.dayMonth == self.weekM.value.weekMonth) {
            if let index = self.weekM.value.days.indexOf({ (storedDay) -> Bool in
                return storedDay.dayNumber == day.dayNumber
            }) {
                //select week
                if self.settingsM.selectionStyle.value == .Week {
                    self.selectedIndex.value = 99 //all the row
                    return
                } else if self.settingsM.selectionStyle.value == .Day {
                    self.selectedIndex.value = index
                }
            }
        }
        self.selectedIndex.value = -1 //no selection
    }
}