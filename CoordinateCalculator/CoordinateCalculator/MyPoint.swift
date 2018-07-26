//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by oingbong on 2018. 7. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private var x:Int
    private var y:Int
    
    public var valueX:Int {
        get {
            return x
        }
        set(newVal) {
            self.x = newVal
        }
    }
    public var valueY:Int {
        get {
            return y
        }
        set(newVal) {
            self.y = newVal
        }
    }
    
    init(x: Int, y:Int) {
        self.x = x
        self.y = y
    }
    
    public mutating func dd(f:Int){
        self.x = f
    }
}
