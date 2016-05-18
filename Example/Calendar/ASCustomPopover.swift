//
//  ASCustomPopover.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation
import UIKit

class ASCustomPopover: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var dataSource = Array<String>() {
        didSet {
            self.preferredContentSize = CGSizeMake(300, 300)
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = UIModalPresentationStyle.Popover;
        self.popoverPresentationController?.delegate = self;
        self.popoverPresentationController?.permittedArrowDirections = .Up
        self.initUI()
    }
    
    func initUI() {
        /*
        self.view.addSubview(self.tableView)
        //add constraint
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        let selfTop = NSLayoutConstraint(item: self.tableView,
                                         attribute: .Top,
                                         relatedBy: .Equal,
                                         toItem: self.view,
                                         attribute: .Top,
                                         multiplier: 1,
                                         constant: 0)
        let selfBottom = NSLayoutConstraint(item: self.tableView,
                                            attribute: .Bottom,
                                            relatedBy: .Equal,
                                            toItem: self.view,
                                            attribute: .Bottom,
                                            multiplier: 1,
                                            constant: 0)
        let selfLeft = NSLayoutConstraint(item: self.tableView,
                                          attribute: .Left,
                                          relatedBy: .Equal,
                                          toItem: self.view,
                                          attribute: .Left,
                                          multiplier: 1,
                                          constant: 0)
        let selfRight = NSLayoutConstraint(item: self.tableView,
                                           attribute: .Right,
                                           relatedBy: .Equal,
                                           toItem: self.view,
                                           attribute: .Right,
                                           multiplier: 1,
                                           constant: 0)
        self.view.addConstraints([selfTop, selfBottom, selfLeft, selfRight])
        //prepare tableview
        self.tableView.dataSource = self
        self.tableView.delegate = self*/
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle{
        return .None
    }
    
}