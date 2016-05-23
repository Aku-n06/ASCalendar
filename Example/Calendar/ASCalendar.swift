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
    var calendarSettings : ASSettingsM!
    var calendarVM : ASCalendarVM!
    
    override init() {
        super.init()
        //get current date
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        let year =  components.year
        let month = components.month
        self.calendarSettings = ASSettingsM(month: month, year: year)
    }
    
    //MARK: public methods
    
    func showCalendarAsLayer() {
        let calendarLayer = ASCustomLayer()
        calendarLayer.showCalendar()
        self.calendarV = calendarLayer.calendar as! ASCalendarV
        self.calendarVM = ASCalendarVM(settings: self.calendarSettings)
        self.calendarV.viewModel = self.calendarVM
    }
    
    
    
}
