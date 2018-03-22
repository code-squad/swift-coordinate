//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint:Point {
    var points: [MyPoint] = []
    private(set) var x, y:Int
    
    init(x:Int, y:Int) {
        self.x = x
        self.y = y
        points = [self]
    }
    
    var xOfCorrdinates:Int { return self.x * 2 + 3}
    var yOfCoordinates:Int { return ANSICode.axis.AxisLimit + 1 - self.y }
}
