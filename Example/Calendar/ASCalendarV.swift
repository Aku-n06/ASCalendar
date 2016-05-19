//
//  ASCalendarV.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation
import UIKit

class ASCalendarV: UIView {
    
    @IBOutlet var bodyV : ASBodyV!
    
    var viewModel: ASCalendarVM! {
        didSet {
            viewModel.month.bindAndFire {
                [unowned self] in
                self.bodyV.showMonth($0)
            }
        }
    }
    
}