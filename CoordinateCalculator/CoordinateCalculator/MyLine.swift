//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    private(set) var pointA = MyPoint(x: 0, y: 0)
    private(set) var pointB = MyPoint(x: 0, y: 0)
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    init(pairA: Pair, pairB: Pair) {
        pointA = MyPoint(x: pairA.x, y: pairA.y)
        pointB = MyPoint(x: pairB.x, y: pairB.y)
    }
}

extension MyLine: AxisDrawable {
    var points: [MyPoint] {
        return [pointA, pointB]
    }
}

extension MyLine: ValueComputable {
    var description: String {
        return "두 점 사이의 거리는 "
    }
    
    func getComputedValue() -> Double {
        return computeLength()
    }
    
    private func computeLength() -> Double {
        let distanceX = pow(Double(pointA.x - pointB.x), 2.0)
        let distanceY = pow(Double(pointA.y - pointB.y), 2.0)
        return sqrt(distanceX + distanceY)
    }
}
