//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 14..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Shape, Dimension {
    private(set) var pointA: MyPoint
    private(set) var pointB: MyPoint
    
    init?(pointA: MyPoint, pointB: MyPoint) {
        guard pointA == pointB else {
            return nil
        }
        self.pointA = pointA
        self.pointB = pointB
    }
    
    func points() -> [MyPoint] {
        return [pointA, pointB]
    }
    
    func area() -> Double {
        return sqrt(pow(Double(pointA.x - pointB.x), 2) + pow(Double(pointA.y - pointB.y), 2))
    }
}
