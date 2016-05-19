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
    
    init(month : Int, year : Int) {
        self.month = month
        self.year = year
        //create a nsdate
        let calendar = NSCalendar.currentCalendar()
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = 1
        let date = calendar.dateFromComponents(components)
        //calculate number of days in month
        let range = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: date!)
        let daysCount = range.length
        //find first day weekday
        let myComponents = calendar.components(.Weekday, fromDate: date!)
        var weekDay = myComponents.weekday
        if weekDay == 1 {// switch to start by monday
            weekDay = 7
        } else {
            weekDay -= 1
        }
        //create weeks
        var allWeeks = Array<ASWeekM>()
        var currentWeek = ASWeekM()
        for i in 1...daysCount {
            //create day
            var currentDay = currentWeek.days[weekDay-1]
            currentDay.dayNumber = i
            currentDay.dayEnabled = true
            currentWeek.days[weekDay-1] = currentDay
            //next day
            weekDay += 1
            if (weekDay > 7) {
                weekDay = 1
                allWeeks.append(currentWeek)
                currentWeek = ASWeekM()
            }
        }
        if (weekDay > 1) {
            allWeeks.append(currentWeek)
        }
        //set new data
        self.weeks = allWeeks
    }
}
