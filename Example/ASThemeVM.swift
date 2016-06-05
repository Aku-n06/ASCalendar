//
//  ASThemeM.swift
//  Example
//
//  Created by alberto.scampini on 24/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import Foundation
import UIKit

class ASThemeVM : NSObject {
    
    var headerColor = Dynamic(UIColor(red:1.00, green:0.16, blue:0.15, alpha:1.00)) //colore della barra del titolo
    var headerTextColor = Dynamic(UIColor.whiteColor()) //colore del titolo
    var headerTextFont = Dynamic(UIFont (name: "Helvetica", size: 16))// font del titolo
    var headerSeparatorColor = Dynamic(UIColor(red:1.00, green:0.16, blue:0.15, alpha:1.00)) //linea di separazione orizzontale nella barra del titolo
    
    var bodyHeaderColor = Dynamic(UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.00)) //colore della barra con i nomi dei giorni della settimana
    var bodyHeaderTextColor = Dynamic(UIColor.blackColor()) //colore del testo dei nomi della settimana
    var bodyHeaderTextFont = Dynamic(UIFont (name: "Helvetica", size: 14))// font dei nomi della settimana
    var bodyHeaderSeparatorColor = Dynamic(UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.00)) //colore della linea di separazione orizzontale nella barra con i nomi dei giorni della settimana

    var bodyBackgroundColor = Dynamic(UIColor.whiteColor()) //sfondo del calendario
    var bodyMonthTitleColor = Dynamic(UIColor(red:1.00, green:0.16, blue:0.15, alpha:1.00)) //colore del nome del mese scritto nel calendario
    var bodyMonthTextFont = Dynamic(UIFont (name: "Helvetica", size: 16))// font dei nomi della settimana
    var bodySeparatorColor = Dynamic(UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.00)) //linea di separazione orizzontale tra un mese e l altro
    
    var bodyDayActiveTextColor = Dynamic(UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.00)) //colore del numero del giorno quando attivo
    var bodyDayInactiveTextColor = Dynamic(UIColor(red:0.44, green:0.44, blue:0.44, alpha:1.00)) //colore del numero del giorno quando inattivo
    var bodyDaySelectedTextColor = Dynamic(UIColor.whiteColor()) //colore del numero del giorno quando selezionato
    var bodyDayTextFont = Dynamic(UIFont (name: "Helvetica", size: 14))// font del numero del giorno
    
    var bodySelectionColor = Dynamic(UIColor(red:1.00, green:0.16, blue:0.15, alpha:1.00)) //colore della selezione
    var daySelectionSize = Dynamic(CGFloat(30))
    var weekSelectionSize = Dynamic(CGFloat(30))
    
    override init() {
        super.init()
    }
    
    func defaults(index : Int) {
        switch index {
        case 1 :
            headerColor.value = UIColor(red:0.39, green:0.88, blue:0.70, alpha:1.00)
            headerTextColor.value = UIColor(red:1.00, green:0.95, blue:0.67, alpha:1.00)
            headerTextFont.value = UIFont (name: "Helvetica", size: 14)
            headerSeparatorColor.value = UIColor(red:0.51, green:0.83, blue:0.71, alpha:1.00)
            
            bodyHeaderColor.value = UIColor(red:1.00, green:0.95, blue:0.67, alpha:1.00)
            bodyHeaderTextColor.value = UIColor(red:1.00, green:0.36, blue:0.36, alpha:1.00)
            bodyHeaderTextFont.value = UIFont (name: "Helvetica", size: 11)
            bodyHeaderSeparatorColor.value = UIColor(red:1.00, green:0.81, blue:0.30, alpha:1.00)
            
            bodyBackgroundColor.value = UIColor(red:1.00, green:0.95, blue:0.67, alpha:1.00)
            bodyMonthTitleColor.value = UIColor(red:0.39, green:0.88, blue:0.70, alpha:1.00)
            bodyMonthTextFont.value = UIFont (name: "Helvetica", size: 11)
            bodySeparatorColor.value = UIColor(red:1.00, green:0.36, blue:0.36, alpha:1.00)
            
            bodyDayActiveTextColor.value = UIColor(red:1.00, green:0.36, blue:0.36, alpha:1.00)
            bodyDayInactiveTextColor.value = UIColor(red:1.00, green:0.81, blue:0.30, alpha:1.00)
            bodyDaySelectedTextColor.value = UIColor(red:0.39, green:0.88, blue:0.70, alpha:1.00)
            bodyDayTextFont.value = UIFont (name: "Helvetica", size: 11)
            
            bodySelectionColor.value = UIColor(red:1.00, green:0.36, blue:0.36, alpha:1.00)
            daySelectionSize.value = CGFloat(30)
            weekSelectionSize.value = CGFloat(30)
            break
        case 2 :
            headerColor.value = UIColor(red:1.00, green:0.35, blue:0.00, alpha:1.00)
            headerTextColor.value = UIColor(red:0.87, green:0.91, blue:0.80, alpha:1.00)
            headerTextFont.value = UIFont (name: "Helvetica", size: 20)
            headerSeparatorColor.value = UIColor(red:1.00, green:0.95, blue:0.67, alpha:1.00)
            
            bodyHeaderColor.value = UIColor(red:0.18, green:0.84, blue:0.93, alpha:1.00)
            bodyHeaderTextColor.value = UIColor(red:0.87, green:0.91, blue:0.80, alpha:1.00)
            bodyHeaderTextFont.value = UIFont (name: "Helvetica", size: 10)
            bodyHeaderSeparatorColor.value = UIColor(red:0.60, green:0.87, blue:0.87, alpha:1.00)
            
            bodyBackgroundColor.value = UIColor(red:0.87, green:0.91, blue:0.80, alpha:1.00)
            bodyMonthTitleColor.value = UIColor(red:1.00, green:0.35, blue:0.00, alpha:1.00)
            bodyMonthTextFont.value = UIFont (name: "Helvetica", size: 10)
            bodySeparatorColor.value = UIColor(red:1.00, green:0.35, blue:0.00, alpha:1.00)
            
            bodyDayActiveTextColor.value = UIColor(red:1.00, green:0.50, blue:0.00, alpha:1.00)
            bodyDayInactiveTextColor.value = UIColor(red:0.60, green:0.87, blue:0.87, alpha:1.00)
            bodyDaySelectedTextColor.value = UIColor(red:0.87, green:0.91, blue:0.80, alpha:1.00)
            bodyDayTextFont.value = UIFont (name: "Helvetica", size: 10)
            
            bodySelectionColor.value = UIColor(red:1.00, green:0.35, blue:0.00, alpha:1.00)
            daySelectionSize.value = CGFloat(20)
            weekSelectionSize.value = CGFloat(20)
            break
        case 3 :
            headerColor.value = UIColor(red:0.18, green:0.49, blue:0.37, alpha:1.00)
            headerTextColor.value = UIColor(red:0.84, green:0.99, blue:0.71, alpha:1.00)
            headerTextFont.value = UIFont (name: "Helvetica", size: 18)
            headerSeparatorColor.value = UIColor(red:0.16, green:0.15, blue:0.24, alpha:1.00)
            
            bodyHeaderColor.value = UIColor(red:0.59, green:0.91, blue:0.49, alpha:1.00)
            bodyHeaderTextColor.value = UIColor(red:0.18, green:0.49, blue:0.37, alpha:1.00)
            bodyHeaderTextFont.value = UIFont (name: "Helvetica", size: 10)
            bodyHeaderSeparatorColor.value = UIColor(red:0.84, green:0.99, blue:0.71, alpha:1.00)
            
            bodyBackgroundColor.value = UIColor(red:0.16, green:0.15, blue:0.24, alpha:1.00)
            bodyMonthTitleColor.value = UIColor(red:0.16, green:0.15, blue:0.24, alpha:1.00)
            bodyMonthTextFont.value = UIFont (name: "Helvetica", size: 10)
            bodySeparatorColor.value = UIColor(red:1.00, green:0.35, blue:0.00, alpha:1.00)
            
            bodyDayActiveTextColor.value = UIColor(red:0.84, green:0.99, blue:0.71, alpha:1.00)
            bodyDayInactiveTextColor.value = UIColor(red:0.18, green:0.49, blue:0.37, alpha:1.00)
            bodyDaySelectedTextColor.value = UIColor(red:0.24, green:0.71, blue:0.53, alpha:1.00)
            bodyDayTextFont.value = UIFont (name: "Helvetica", size: 10)
            
            bodySelectionColor.value = UIColor(red:0.59, green:0.91, blue:0.49, alpha:1.00)
            daySelectionSize.value = CGFloat(30)
            weekSelectionSize.value = CGFloat(2)
            break
        case 4 :
            headerColor.value = UIColor(red:1.00, green:0.45, blue:0.12, alpha:1.00)
            headerTextColor.value = UIColor(red:1.00, green:0.75, blue:0.25, alpha:1.00)
            headerTextFont.value = UIFont (name: "Helvetica", size: 18)
            headerSeparatorColor.value = UIColor(red:1.00, green:0.58, blue:0.37, alpha:1.00)
            
            bodyHeaderColor.value = UIColor(red:0.55, green:0.57, blue:0.80, alpha:1.00)
            bodyHeaderTextColor.value = UIColor(red:1.00, green:0.49, blue:0.74, alpha:1.00)
            bodyHeaderTextFont.value = UIFont (name: "Helvetica", size: 10)
            bodyHeaderSeparatorColor.value = UIColor(red:0.65, green:0.67, blue:0.82, alpha:1.00)
            
            bodyBackgroundColor.value = UIColor(red:0.80, green:0.91, blue:0.62, alpha:1.00)
            bodyMonthTitleColor.value = UIColor(red:0.16, green:0.15, blue:0.24, alpha:1.00)
            bodyMonthTextFont.value = UIFont (name: "Helvetica", size: 10)
            bodySeparatorColor.value = UIColor(red:1.00, green:0.35, blue:0.00, alpha:1.00)
            
            bodyDayActiveTextColor.value = UIColor(red:1.00, green:0.75, blue:0.25, alpha:1.00)
            bodyDayInactiveTextColor.value = UIColor(red:1.00, green:0.49, blue:0.74, alpha:1.00)
            bodyDaySelectedTextColor.value = UIColor(red:1.00, green:0.75, blue:0.25, alpha:1.00)
            bodyDayTextFont.value = UIFont (name: "Helvetica", size: 10)
            
            bodySelectionColor.value = UIColor(red:1.00, green:0.58, blue:0.37, alpha:1.00)
            daySelectionSize.value = CGFloat(30)
            weekSelectionSize.value = CGFloat(2)
            break
        
        default :
            break
        }
    }
    
}
