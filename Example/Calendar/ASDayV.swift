//
//  ASDayV.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import UIKit

class ASDayV : UIView {
    
    @IBOutlet var numberLabel : UILabel!
    @IBOutlet var bubbleView : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //bubbleView.hidden = true
        //numberLabel.text = ""
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: public methods
    
    func populate(dayNumber : Int, selected : Bool, enabled : Bool) {
        self.hidden = !enabled
        if (enabled == true) {
            self.numberLabel.text = String(dayNumber)
            bubbleView.hidden = !selected
        }
    }
    
}