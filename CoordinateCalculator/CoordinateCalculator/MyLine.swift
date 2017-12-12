//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 12..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    var pointA = MyPoint(x : 0, y : 0)
    var pointB = MyPoint(x : 0, y : 0)
    
    init(pointA : MyPoint, pointB : MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    init(points : [MyPoint]) {
        self.pointA = points[0]
        self.pointB = points[1]
    }
    
    func calculateDistance() -> Double{
        let gapOfX = Double(self.pointA.x - self.pointB.x)
        let gapOfY = Double(self.pointA.y - self.pointB.y)
        let distance = sqrt(Double(pow(gapOfX, 2) + Double(pow(gapOfY, 2))))
        return distance
    }
}
