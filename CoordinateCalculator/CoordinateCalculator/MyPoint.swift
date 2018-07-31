//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by oingbong on 2018. 7. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint:ShapeProtocol {
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
    
    init() {
        self.x = 0
        self.y = 0
    }
    
    init(x: Int, y:Int) {
        self.x = x
        self.y = y
    }
    
    init(points:[MyPoint]) {
        self.x = points[0].valueX
        self.y = points[0].valueY
    }
    
    public func message() -> String {
        return ""
    }
    
}
