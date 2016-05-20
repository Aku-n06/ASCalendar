//
//  ASBodyVM.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

class ASBodyVM: NSObject {
    
    var settingsM: ASSettingsM!
    
    init(settings: ASSettingsM) {
        self.settingsM = settings
    }
    
    internal func switchMonth(increment : Bool) {
        var mutantingMonth = self.settingsM.selectedMonth.value.month
        var mutantingYear = self.settingsM.selectedMonth.value.year
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
        self.settingsM.selectedMonth.value = (month : mutantingMonth, year : mutantingYear)
    }
    
    internal func calculateMonthOffset(row : Int) -> (month: Int, year: Int) {
        var monthOffset = self.settingsM.selectedMonth.value.month
        var yearOffset = self.settingsM.selectedMonth.value.year
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
    
    //MARK: public methods
    
    func getViewModelForRow(index : Int, currentViewModel : ASMonthCellVM?) -> ASMonthCellVM? {
        let offset = self.calculateMonthOffset(index)
        let month = ASMonthM(month: offset.month, year: offset.year)
        //update or return the viewModel
        if (currentViewModel != nil) {
            currentViewModel!.monthM.value = month
            return nil
        }
        return ASMonthCellVM(settings: self.settingsM, monthM: month)
    }
    
}
