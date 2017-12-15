//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 12..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : MyShape {
    var pointA = MyPoint(x : 0, y : 0)
    var pointB = MyPoint(x : 0, y : 0)
    var currentShape: String = "line"
    
    init(pointA : MyPoint, pointB : MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    init(points : [MyPoint]) {
        self.pointA = points[0]
        self.pointB = points[1]
    }
    
    func generateCoordinate() -> [MyPoint] {
        let twoPoints = [MyPoint.init(x: self.pointA.x, y: self.pointA.y),
                         MyPoint.init(x: self.pointB.x, y: self.pointB.y)]
        return twoPoints
    }
    
    func calculateShape() -> Double {
        let gapOfX = Double(self.pointA.x - self.pointB.x)
        let gapOfY = Double(self.pointA.y - self.pointB.y)
        let distance = sqrt(Double(pow(gapOfX, 2) + Double(pow(gapOfY, 2))))
        return distance
    }
}
