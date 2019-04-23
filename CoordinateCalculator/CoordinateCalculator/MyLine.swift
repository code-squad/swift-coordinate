//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/19/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Figure {
    var pointA = MyPoint(x: [0], y: [0])
    var pointB = MyPoint(x: [0], y: [0])
    var length: Double = 0.0
    
    init(x: [Int], y: [Int]) {
        self.pointA.x = x[0]
        self.pointB.x = x[1]
        self.pointA.y = y[0]
        self.pointB.y = y[1]
        self.length = calculateLength()
    }
    
    init(_ points: [MyPoint]) {
        self.pointA = points[0]
        self.pointB = points[1]
        self.length = calculateLength()
    }
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }

    private func calculateLength () -> Double {
        let legA = pow(Double(pointA.x - pointB.x), 2)
        let legB = pow(Double(pointA.y - pointB.y), 2)
        
        return sqrt(legA + legB)
    }
}
