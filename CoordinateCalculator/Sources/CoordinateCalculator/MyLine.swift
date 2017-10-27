//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    
    private(set) var pointA: MyPoint
    private(set) var pointB: MyPoint
    
    init() {
        pointA = MyPoint()
        pointB = MyPoint()
    }
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
}

// MARK: Method
extension MyLine {
    func distance() -> Double {
        let temp = pow(Double(pointA.x - pointB.x), 2.0) + pow(Double(pointA.y - pointB.y), 2.0)
        return sqrt(temp)
    }
}

extension MyLine: Figure {
    var points: [MyPoint] {
        return [pointA, pointB]
    }
}
