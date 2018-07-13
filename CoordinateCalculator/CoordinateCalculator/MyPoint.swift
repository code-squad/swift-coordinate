//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 1100200 on 2018. 7. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private (set) var x = 0
    private (set) var y = 0
    
    var myPointXY: MyPoint {
        get {
            return MyPoint(x: self.x * 2 + 3, y:  abs(self.y - 24) + 1) // to calculate axis
        }
    }
    
}
