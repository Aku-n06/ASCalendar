//
//  ASDayV.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import UIKit

class ASDayV : UIView {
    
    var numberLabel : UILabel!
    var selectionV : UIView!
    
    var viewModel : ASDayVM! {
        didSet {
            self.viewModel.dayM.bindAndFire {
                [unowned self] in
                self.hidden = !$0.dayEnabled
                if ($0.dayEnabled == true) {
                    self.numberLabel.text = String($0.dayNumber)
                    self.selectionV.hidden = !$0.daySelected
                    if ($0.daySelectable == true) {
                        self.numberLabel.textColor = self.theme.bodyDayActiveTextColor.value
                    } else {
                        self.numberLabel.textColor = self.theme.bodyDayInactiveTextColor.value
                    }
                    if ($0.daySelected == true) {
                        self.numberLabel.textColor = self.theme.bodyDaySelectedTextColor.value
                    }
                }
            }
        }
    }
    
    var theme : ASThemeVM! {
        didSet {
            theme.bodySelectionColor.bindAndFire {
                [unowned self] in
                self.selectionV.backgroundColor = $0
            }
            theme.bodyDayActiveTextColor.bind{
                [unowned self] in
                if (self.viewModel.dayM.value.daySelectable == true) {
                    self.numberLabel.textColor = $0
                }
            }
            theme.bodyDayInactiveTextColor.bind{
                [unowned self] in
                if (self.viewModel.dayM.value.daySelectable == true) {
                    self.numberLabel.textColor = $0
                }
            }
            theme.bodyDaySelectedTextColor.bind{
                [unowned self] in
                if (self.viewModel.dayM.value.daySelected == true) {
                    self.numberLabel.textColor = $0
                }
            }
            theme.bodyDayTextFont.bindAndFire {
                [unowned self] in
                self.numberLabel.font = $0
            }
            theme.daySelectionSize.bindAndFire {
                [unowned self] in
                self.selectionV.frame = CGRectMake(0, 0, $0, $0)
                self.selectionV.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //add selectionView
        selectionV = UIView.init(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        selectionV.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        selectionV.layer.cornerRadius = self.selectionV.frame.size.height/2
        self.addSubview(selectionV)
        //add numberLabel
        numberLabel = UILabel.init(frame: self.bounds)
        numberLabel.textAlignment = .Center
        self.addSubview(numberLabel)
        //gesture
        let tapGesture  = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.addGestureRecognizer(tapGesture)
        self.userInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //MARK: user interaction
    
    func handleTap () {
        if (self.viewModel.dayM.value.daySelectable == true) {
            self.viewModel.selected()
        }
    }
    
    //MARK: custom layout
    
    func layoutViews() {
        numberLabel.frame = self.bounds
        selectionV.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        selectionV.layer.cornerRadius = self.selectionV.frame.size.height/2
    }
 
}
