//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 14..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Shape {
    private(set) var pointA: MyPoint
    private(set) var pointB: MyPoint
    
    var area: Double? {
        return sqrt(pow(Double(pointA.x - pointB.x), 2) + pow(Double(pointA.y - pointB.y), 2))
    }
}
