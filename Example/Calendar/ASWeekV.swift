//
//  ASWeekV.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//


import UIKit

class ASWeekV : UIView {
    
    var boxesV : Array<ASDayV>!
    var selectionV : UIView!
    var viewModel : ASWeekVM! {
        didSet {
            self.viewModel.weekM.bindAndFire {
                [unowned self] in
                self.selectionV.hidden = !$0.weekSelected
                //update viewmodel for each day box
                for i in 0..<7 {
                    if (self.boxesV[i].viewModel == nil) {
                        self.boxesV[i].viewModel = self.viewModel.getModelForIndex(i, currentViewModel: nil)
                    } else {
                        self.viewModel.getModelForIndex(i, currentViewModel: self.boxesV[i].viewModel)
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
            theme.weekSelectionSize.bindAndFire {
                [unowned self] in
                self.selectionV.frame = CGRectMake(0, 0, self.frame.size.width - 4, $0)
            }
            //set theme vm to cell views
            self.boxesV.forEach { (boxV) in
                boxV.theme = theme
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //add selection view
        selectionV = UIView(frame: CGRectMake(0, 0, self.frame.size.width - 4, 32))
        selectionV.center = CGPoint(x: frame.width/2, y: frame.height/2)
        selectionV.backgroundColor = UIColor.redColor()
        self.addSubview(selectionV)
        //add day views
        boxesV = Array<ASDayV>()
        let dayW = frame.width / 7
        for i in 0..<7 {
            let dayV = ASDayV(frame: CGRect(x: CGFloat(i) * dayW, y: 0, width: dayW, height: frame.height))
            self.boxesV.append(dayV)
            self.addSubview(dayV)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: custom layout
    
    func layoutViews() {
        let dayW = frame.width / 7
        for i in 0..<7 {
            boxesV[i].frame = CGRect(x: CGFloat(i) * dayW, y: 0, width: dayW, height: frame.height)
            boxesV[i].layoutViews()
        }
        selectionV.center = CGPoint(x: frame.width/2, y: frame.height/2)
    }
    
}
