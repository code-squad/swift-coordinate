//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 24/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine{
    private var pointA: MyPoint
    private var pointB: MyPoint
    
    var displayablePoint: [MyPoint] {
        return [pointA, pointB]
    }
    
    var distance: Double {
        return sqrt(pow(Double(pointA.x - pointB.x), 2) + pow(Double(pointA.y - pointB.y), 2))
    }
    
    init(points: [MyPoint]) {
        self.pointA = points[0]
        self.pointB = points[1]
    }
}
