//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: AxisDrawable, ValueComputable {
    private var pointA = MyPoint(x: 0, y: 0)
    private var pointB = MyPoint(x: 0, y: 0)
    
    var description: String {
        return "두 점 사이의 거리는 "
    }
    
    init(pairA: Pair, pairB: Pair) {
        pointA = MyPoint(x: pairA.x, y: pairA.y)
        pointB = MyPoint(x: pairB.x, y: pairB.y)
    }
    
    func getPoints() -> [MyPoint] {
        return [pointA, pointB]
    }
    
    func getComputedValue() -> Double {
        return getLength()
    }
    
    private func getLength() -> Double {
        let distanceX = pow(Double(pointA.x - pointB.x), 2.0)
        let distanceY = pow(Double(pointA.y - pointB.y), 2.0)
        return sqrt(distanceX + distanceY)
    }
}
