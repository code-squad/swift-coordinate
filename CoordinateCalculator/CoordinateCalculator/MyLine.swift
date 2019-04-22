//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/19/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Figure {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    var length: Double = 0.0
    
    init(x: Int, y: Int) {
        self.pointA.x = x
        self.pointB.x = x
        self.pointA.y = y
        self.pointB.y = y
    }
    
    init(_ points: [MyPoint]) {
        self.pointA = points[0]
        self.pointB = points[1]
        self.length = calculateLength(points)
    }

    private func calculateLength(_ points: [MyPoint]) -> Double {
        let legA = pow(Double(points[0].x - points[1].x), 2)
        let legB = pow(Double(points[0].y - points[1].y), 2)
        
        return sqrt(legA + legB)
    }
}
