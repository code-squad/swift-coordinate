//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: AxisDrawable {
    private var pointA = MyPoint(x: 0, y: 0)
    private var pointB = MyPoint(x: 0, y: 0)
    
    
    init(pairs: [Pair]) {
        pointA = MyPoint(x: pairs[0].x, y: pairs[0].y)
        pointB = MyPoint(x: pairs[1].x, y: pairs[1].y)
    }
    
    func getPoints() -> [MyPoint] {
        return [pointA, pointB]
    }
    
    func getLength() -> Double {
        let distanceX = pow(Double(pointA.x - pointB.x), 2.0)
        let distanceY = pow(Double(pointA.y - pointB.y), 2.0)
        return sqrt(distanceX + distanceY)
    }
}
