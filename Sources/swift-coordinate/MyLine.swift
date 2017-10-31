//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 10. 31..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Points {
    private(set) var pointA : MyPoint
    private(set) var pointB : MyPoint
    private(set) var points : [MyPoint]
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
        self.points = [self.pointA, self.pointB]
    }
    func getDistance() -> Double {
        return sqrt(pow(Double(self.pointA.x - self.pointB.x), 2) + pow(Double(self.pointA.y - self.pointB.y), 2))
    }
    
}
