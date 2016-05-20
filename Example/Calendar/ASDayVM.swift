//
//  ASDayVM.swift
//  Example
//
//  Created by alberto.scampini on 20/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

class ASDayVM: NSObject {
    
    var settingsM : ASSettingsM!
    var dayM : Dynamic<ASDayM>!
    
    init(settings: ASSettingsM, day: ASDayM) {
        self.settingsM = settings
        self.dayM = Dynamic(day)
        super.init()
    }
    
    //MARK: public methods
    
    var touched : Dynamic<Bool>!
    
    func selected() {
        self.settingsM.selectedDay.value = self.dayM.value
    }
    
}