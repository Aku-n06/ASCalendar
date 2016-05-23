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
}