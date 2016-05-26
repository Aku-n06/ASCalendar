//
//  ViewController.swift
//  Example
//
//  Created by alberto.scampini on 18/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ASCalendarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openDefault(sender : UIButton) {
        let calendar = ASCalendar()
        calendar.delegate = self
        calendar.setMondayFirstWeekDay(true)
        calendar.showCalendarAsLayer()
    }

    //MARK: calendar delegate
    
    func calendarSelect(day: Int, week: Int, month: Int, year: Int) {
        NSLog("%d-%d-%d (%d)", day, month, year, week)
    }
}
