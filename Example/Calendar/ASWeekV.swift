//
//  ASWeekV.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//


import UIKit

class ASWeekV : UIView {
    
    @IBOutlet var boxesV : Array<ASWeekBoxV>!
    var viewModel : ASWeekVM! {
        didSet {
            self.viewModel.weekM.bindAndFire {
                [unowned self] in
                _ = $0
                for i in 0..<7 {
                    if (self.boxesV[i].view.viewModel == nil) {
                        self.boxesV[i].view.viewModel = self.viewModel.getModelForIndex(i, currentViewModel: nil)
                    } else {
                        self.viewModel.getModelForIndex(i, currentViewModel: self.boxesV[i].view.viewModel)
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}