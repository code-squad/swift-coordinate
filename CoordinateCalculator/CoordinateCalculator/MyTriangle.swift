//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    var lineAB = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    var lineBC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    var lineAC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
    
    init(_ points: [MyPoint]) {
        self.lineAB = MyLine(pointA: points[0], pointB: points[1])
        self.lineBC = MyLine(pointA: points[1], pointB: points[2])
        self.lineAC = MyLine(pointA: points[0], pointB: points[2])
    }
    
    func calculateArea() -> Double {
        let a = self.lineBC.calculateDistance()
        let b = self.lineAC.calculateDistance()
        let c = self.lineAB.calculateDistance()
        let cos = (pow(a, 2) + pow(c, 2) - pow(b, 2)) / (2 * a * c)
        let sin = sqrt(1 - pow(cos, 2))
        let area = 0.5 * a * c * sin
        return area
    }
}

