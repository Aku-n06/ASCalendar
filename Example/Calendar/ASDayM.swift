//
//  ASDayM.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

struct ASDayM {
    
    var dayYear : Int!
    var dayMonth : Int!
    var dayWeek : Int!
    var dayNumber : Int!
    var daySelected : Bool!
    var daySelectable : Bool!
    var dayEnabled : Bool!
    
    init() {
        dayNumber = 0
        daySelected = false
        dayEnabled = false
        daySelectable = true
        dayYear = 0
        dayMonth = 0
        dayWeek = 0
    }
    
    init(day : Int, month: Int, year: Int) {
        dayNumber = day
        daySelected = false
        dayEnabled = false
        daySelectable = true
        dayYear = year
        dayMonth = month
        //create a nsdate
        let calendar = NSCalendar.currentCalendar()
        calendar.minimumDaysInFirstWeek = 7
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        let date = calendar.dateFromComponents(components)
        //calculate week
        let myComponents = calendar.components([.Weekday, .WeekOfYear], fromDate: date!)
        dayWeek = myComponents.weekOfYear
    }
}