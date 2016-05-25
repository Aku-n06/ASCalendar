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
    var bodyHeaderSeparatorColor = Dynamic(UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.00)) //colore della linea di separazione orizzontale nella barra con i nomi dei giorni della settimana
    var bodyHeaderTextFont = Dynamic(UIFont (name: "Helvetica", size: 14))// font dei nomi della settimana

    var bodyBackgroundColor = Dynamic(UIColor.whiteColor()) //sfondo del calendario
    var bodySeparatorColor = Dynamic(UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.00)) //linea di separazione orizzontale tra un mese e l altro
    var bodyMonthTitleColor = Dynamic(UIColor(red:1.00, green:0.16, blue:0.15, alpha:1.00)) //colore del nome del mese scritto nel calendario
    var bodyMonthTextFont = Dynamic(UIFont (name: "Helvetica", size: 16))// font dei nomi della settimana
    var bodyDayActiveTextColor = Dynamic(UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.00)) //colore del numero del giorno quando attivo
    var bodyDayInactiveTextColor = Dynamic(UIColor(red:0.44, green:0.44, blue:0.44, alpha:1.00)) //colore del numero del giorno quando inattivo
    var bodyDaySelectedTextColor = Dynamic(UIColor.whiteColor()) //colore del numero del giorno quando selezionato
    var bodySelectionColor = Dynamic(UIColor(red:1.00, green:0.16, blue:0.15, alpha:1.00)) //colore della selezione
    var bodyDayTextFont = Dynamic(UIFont (name: "Helvetica", size: 14))// font del numero del giorno
    
    var daySelectionSize = Dynamic(CGFloat(30))
    var weekSelectionSize = Dynamic(CGFloat(30))
    override init() {
        super.init()
    }
    
}