//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 9. 7..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: MyPointConvertible {
    func convertMyPoint() -> [MyPoint] {
        return [pointA, pointB]
    }
    
    private (set) var pointAB: [MyPoint]
    private var pointA: MyPoint
    private var pointB: MyPoint
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
        self.pointAB = [pointA, pointB]
    }
    
    func distanceCalc() -> Double {
        let distance = pow(Double(pointA.x - pointB.x), 2.0) + pow(Double(pointA.y - pointB.y), 2.0)
        return sqrt(distance)
    }
}
