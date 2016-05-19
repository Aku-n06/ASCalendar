//
//  ASCalendarNamesM.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

protocol ASCalendarNamesM {
    func getWeekNames() -> Array<String>
    func getMonthNames() -> Array<String>
}

extension ASCalendarNamesM {
    
    func getWeekNames() -> Array<String> {
        //get day names
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale.currentLocale()
        let fullWeekDays = formatter.weekdaySymbols
        var weekDays = Array<String>()
        for i in 1...6 {
            weekDays.append(String(fullWeekDays[i].characters.first!).uppercaseString)
        }
        //move sunday at the end of the week
        weekDays.append(String(fullWeekDays[0].characters.first!).uppercaseString)
        return weekDays
    }
    
    func getMonthNames() -> Array<String> {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale.currentLocale()
        return formatter.monthSymbols
    }
    
}