//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    func distance() -> Double {
        return sqrt(pow(Double(pointA.x - pointB.x), 2) + pow(Double(pointA.y - pointB.y), 2))
    }
}
