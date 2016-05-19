//
//  ASCalendar.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

class ASCalendar: NSObject {
    
    override init() {
        super.init()
    }
    
    //MARK: public methods
    
    func showCalendarAsLayer() {
        let calendarLayer = ASCustomLayer()
        calendarLayer.showCalendar()
    }
    
}
