//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
    
    var xOfCorrdinates:Int { return self.x * 2 + 3}
    var yOfCoordinates:Int { return ANSICode.axis.AxisLimit + 1 - self.y }
}
