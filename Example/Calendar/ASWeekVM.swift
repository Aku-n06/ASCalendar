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
        
    init(settings : ASSettingsM, weekM : ASWeekM) {
        super.init()
        self.settingsM = settings
        self.weekM = Dynamic(weekM)
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

}