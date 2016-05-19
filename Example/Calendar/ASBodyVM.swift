//
//  ASBodyVM.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

class ASBodyVM: NSObject {
    
    var selectedMonth: Dynamic<(month : Int, year : Int)>!
    
    init(month : Int, year : Int) {
        self.selectedMonth = Dynamic(month : month, year : year)
    }
    
    internal func switchMonth(increment : Bool) {
        var mutantingMonth = self.selectedMonth.value.month
        var mutantingYear = self.selectedMonth.value.year
        if (increment == false) {
            //previus month
            mutantingMonth -= 1
            if (mutantingMonth == 0) {
                mutantingMonth = 12
                mutantingYear -= 1
            }
        } else if (increment == true) {
            //next month
            mutantingMonth += 1
            if (mutantingMonth == 13) {
                mutantingMonth = 1
                mutantingYear += 1
            }
        }
        //apply
        selectedMonth.value = (month : mutantingMonth, year : mutantingYear)
    }
    
    internal func calculateMonthOffset(row : Int) -> (month: Int, year: Int) {
        var monthOffset = self.selectedMonth.value.month
        var yearOffset = self.selectedMonth.value.year
        let offset = row - 1
        monthOffset = monthOffset + offset
        if (monthOffset == 13) {
            monthOffset = 1
            yearOffset += 1
        }
        else if (monthOffset == 0) {
            monthOffset = 12
            yearOffset -= 1
        }
        return (month: monthOffset, year: yearOffset)
    }
    
}
