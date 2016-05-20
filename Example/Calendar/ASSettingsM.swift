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

struct ASSettingsM {
    
    var selectionStyle : BodySelectionStyle!
    
    init() {
        self.selectionStyle = .Week
    }
}