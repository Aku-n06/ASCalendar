//
//  ASCalendar.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

class ASCalendar: NSObject {
    
    var calendarV : ASCalendarV!
    var calendarVM : ASCalendarVM!
    
    override init() {
        super.init()
    }
    
    //MARK: public methods
    
    func showCalendarAsLayer() {
        let calendarLayer = ASCustomLayer()
        calendarLayer.showCalendar()
        self.calendarV = calendarLayer.calendar as! ASCalendarV
    }
    
    func goToPage(month: Int, year: Int) {
        let settings = ASSettingsM(month: month, year: year)
        self.calendarVM = ASCalendarVM(month: month, year: year, settings: settings)
        self.calendarV.viewModel = self.calendarVM
    }
    
}
