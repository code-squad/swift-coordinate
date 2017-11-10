//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 9..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
}
