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
    }
    public var valueY:Int {
        get {
            return y
        }
    }
    
    init(x: Int, y:Int) {
        self.x = x
        self.y = y
    }
}
