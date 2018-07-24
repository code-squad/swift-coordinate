//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by oingbong on 2018. 7. 24..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    private var pointA = MyPoint(x: 0, y: 0)
    private var pointB = MyPoint(x: 0, y: 0)
    
    public var a:MyPoint {
        get {
            return pointA
        }
    }
    public var b:MyPoint {
        get {
            return pointB
        }
    }
    
    init(pointA:MyPoint , pointB:MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
}
