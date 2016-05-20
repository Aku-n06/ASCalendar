//
//  ASSettingsM.swift
//  Example
//
//  Created by alberto.scampini on 20/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation

enum BodySelectionStyle {
    case Week
}

class ASSettingsM : NSObject {
    
    var selectionStyle : Dynamic<BodySelectionStyle>!
    var selectedMonth : Dynamic<(month : Int, year: Int)>!
    
    init(month : Int, year : Int) {
        super.init()
        self.selectedMonth = Dynamic((month : month, year: year))
        self.selectionStyle = Dynamic(.Week)
    }
}