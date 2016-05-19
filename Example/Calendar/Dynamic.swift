//
//  Dynamic.swift
//  MVVM
//
//  Created by alberto.scampini on 17/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

//  This is the binding, used to connect the View and the ViewModel for
//  MVVM design pattern

class Dynamic<T> {
    typealias Listener = T -> Void
    var listener: Listener?
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}