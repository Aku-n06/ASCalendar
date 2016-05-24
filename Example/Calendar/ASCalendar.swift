//
//  ASCalendar.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

protocol ASCalendarDelegate: class {
    func calendarSelect(day: Int, week: Int, month: Int, year: Int)
}

class ASCalendar: NSObject {
    
    internal var calendarV : ASCalendarV!
    internal var calendarSettings : ASSettingsM!
    internal var calendarVM : ASCalendarVM!
    var theme = ASThemeVM()
    weak var delegate : ASCalendarDelegate?
    
    override init() {
        super.init()
        //get current date
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        let year =  components.year
        let month = components.month
        //create default settings
        self.calendarSettings = ASSettingsM(month: month, year: year)
        self.calendarSettings.selectedDay.bind {
            self.delegate?.calendarSelect($0.dayNumber, week: $0.dayWeek, month: $0.dayMonth, year: $0.dayYear)
        }
    }
    
    //MARK: public methods
    
    func showCalendarAsLayer() {
        let calendarLayer = ASCustomLayer()
        calendarLayer.showCalendar()
        self.calendarV = calendarLayer.calendar as! ASCalendarV
        self.calendarVM = ASCalendarVM(settings: self.calendarSettings)
        self.calendarV.theme = self.theme
        self.calendarV.viewModel = self.calendarVM
    }
    
    func setcurrentPage(month: Int, year: Int) {
        self.calendarSettings.selectedMonth.value = (month: month, year: year)
    }
    
    func setFirstSelectableDate(day: Int, month: Int, year: Int) {
        self.calendarSettings.firstSelectableDate.value = (day : day, month : month, year: year)
    }
    
    func setLastSelectableDate(day: Int, month: Int, year: Int) {
        self.calendarSettings.lastSelectableDate.value = (day : day, month : month, year: year)
    }
    
}
