//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 17..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
}

extension MyPoint: MyShape, Equatable {
   func calculate() -> Double {
        return 0
    }
    
    static func == (pointA: MyPoint, pointB: MyPoint) -> Bool {
        return (pointA.x == pointB.x && pointA.y == pointB.y)
    }
}

