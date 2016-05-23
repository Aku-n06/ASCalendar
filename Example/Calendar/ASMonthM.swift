//
//  ASMonthM.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

struct ASMonthM {
    
    var month: Int!
    var year : Int!
    var weeks : Array<ASWeekM>!
    
    init(month : Int, year : Int, settings : ASSettingsM) {
        self.month = month
        self.year = year
        //create a nsdate
        let calendar = NSCalendar.currentCalendar()
        calendar.minimumDaysInFirstWeek = 7
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = 1
        let date = calendar.dateFromComponents(components)
        //calculate number of days in month
        let range = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: date!)
        let daysCount = range.length
        //find first day weekday
        let myComponents = calendar.components([.Weekday, .WeekOfYear], fromDate: date!)
        var weekNumber = myComponents.weekOfYear
        var weekDay = myComponents.weekday
        if weekDay == 1 {// switch to start by monday
            weekDay = 7
        } else {
            weekDay -= 1
        }
        //create weeks
        var allWeeks = Array<ASWeekM>()
        var currentWeek = ASWeekM()
        currentWeek.weekMonth = month
        currentWeek.weekYear = year
        for i in 1...daysCount {
            //create day
            var currentDay = currentWeek.days[weekDay-1]
            currentDay.dayNumber = i
            currentDay.dayMonth = month
            currentDay.dayYear = year
            currentDay.dayWeek = weekNumber
            currentDay.dayEnabled = true
            //check settings
            if ((year < settings.firstSelectableDate.value.year) ||
                (year == settings.firstSelectableDate.value.year &&
                month < settings.firstSelectableDate.value.month) ||
                (year == settings.firstSelectableDate.value.year &&
                month == settings.firstSelectableDate.value.month &&
                i < settings.firstSelectableDate.value.day))
            {
                currentDay.daySelectable = false
            } else if ((year > settings.lastSelectableDate.value.year) ||
                       (year == settings.lastSelectableDate.value.year &&
                       month > settings.lastSelectableDate.value.month) ||
                       (year == settings.lastSelectableDate.value.year &&
                       month == settings.lastSelectableDate.value.month &&
                       i > settings.lastSelectableDate.value.day))
            {
                currentDay.daySelectable = false
            } else {
                currentDay.daySelectable = true
            }
            //add
            currentWeek.days[weekDay-1] = currentDay
            //next day
            weekDay += 1
            if (weekDay > 7) {
                weekDay = 1
                allWeeks.append(currentWeek)
                currentWeek = ASWeekM()
                weekNumber += 1
                currentWeek.weekMonth = month
                currentWeek.weekYear = year
            }
        }
        if (weekDay > 1) {
            allWeeks.append(currentWeek)
        }
        //set new data
        self.weeks = allWeeks
    }
}
