//
//  ASCustomLayer.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//


import UIKit

class ASCustomLayer: UIView {
    
    var calendar : UIView!
    var blackLayer : UIView!
    
    //MARK: initialisations
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit () {
        self.backgroundColor = UIColor.clearColor()
    }
    
    //MARK: public methods
    
    func showCalendar () {
        self.createLayer()
        self.presentationAnimations()
    }
    
    //MARK: user interaction 
    
    func handleTap() {
        self.closingAnimations()
    }
    
    //MARK: private methods
    
    internal func createLayer () {
        //create self
        let mainWindow : UIWindow = UIApplication.sharedApplication().keyWindow!
        self.translatesAutoresizingMaskIntoConstraints = false
        mainWindow.addSubview(self)
        //set self layout
        let topConstraint = NSLayoutConstraint(
            item: self,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: mainWindow,
            attribute: .Top,
            multiplier: 1,
            constant: 0
        )
        let bottomConstraint = NSLayoutConstraint(
            item: self,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: mainWindow,
            attribute: .Bottom,
            multiplier: 1,
            constant: 0
        )
        let leftConstraint = NSLayoutConstraint(
            item: self,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: mainWindow,
            attribute: .Left,
            multiplier: 1,
            constant: 0
        )
        let rightConstraint = NSLayoutConstraint(
            item: self,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: mainWindow,
            attribute: .Right,
            multiplier: 1,
            constant: 0
        )
        mainWindow.addConstraints([topConstraint,bottomConstraint,leftConstraint,rightConstraint])
        //create black layer
        self.blackLayer = UIView()
        self.blackLayer.backgroundColor = UIColor.clearColor()
        self.addSubview(blackLayer)
        self.blackLayer.translatesAutoresizingMaskIntoConstraints = false
        //set black layer layout
        let topLayerConstraint = NSLayoutConstraint(
            item: self.blackLayer,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1,
            constant: 0
        )
        let bottomLayerConstraint = NSLayoutConstraint(
            item: self.blackLayer,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1,
            constant: 0
        )
        let leftLayerConstraint = NSLayoutConstraint(
            item: self.blackLayer,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1,
            constant: 0
        )
        let rightLayerConstraint = NSLayoutConstraint(
            item: self.blackLayer,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1,
            constant: 0
        )
        self.addConstraints([topLayerConstraint,bottomLayerConstraint,leftLayerConstraint,rightLayerConstraint])
        //add tap gesture to layer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.blackLayer.addGestureRecognizer(tapGesture)
        //load calendar view
        self.calendar = loadViewFromNib()
        self.calendar.alpha = 0
        self.calendar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.calendar)
        //set calendar view layout
        let centerXConstraint = NSLayoutConstraint(
            item: self.calendar,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1,
            constant: 0
        )
        self.centerYConstraint = NSLayoutConstraint(
            item: self.calendar,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1,
            constant: 100)
        let widthConstraint = NSLayoutConstraint(
            item: self.calendar,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1.0,
            constant: 250)
        
        let heightConstraint = NSLayoutConstraint(
            item: self.calendar,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1.0,
            constant: 250)

        self.addConstraints([
            centerXConstraint,
            self.centerYConstraint,
            widthConstraint,
            heightConstraint]
        )
        //apply layout
        self.layoutIfNeeded()
    }
    
    internal func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "ASCalendarV", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    var centerYConstraint : NSLayoutConstraint!
    
    internal func presentationAnimations() {
        self.centerYConstraint.constant = 0
        UIView.animateWithDuration(0.2) {
            self.blackLayer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
            self.calendar.alpha = 1
            self.layoutIfNeeded()
        }
    }
    
    internal func closingAnimations() {
        UIView.animateWithDuration(0.2, animations: {
            self.blackLayer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            self.calendar.alpha = 0
            self.centerYConstraint.constant = 100
            self.layoutIfNeeded()
            }, completion: {[unowned self] (flag)  in
                self.removeFromSuperview()
        })
    }
    
}

