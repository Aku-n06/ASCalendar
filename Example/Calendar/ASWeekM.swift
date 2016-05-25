//
//  ASWeekM.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

struct ASWeekM {
    
    var weekNumber : Int!
    var weekYear : Int!
    var weekMonth : Int!
    var weekSelected : Bool!
    var days : Array<ASDayM>!
    
    init() {
        //create disabled days
        weekSelected = false
        var allDays = Array<ASDayM>()
        for _ in 0...6 {
            let day = ASDayM()
            allDays.append(day)
        }
        days = allDays
    }
    
}