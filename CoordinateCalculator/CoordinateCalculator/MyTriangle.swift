//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: MyShape {
    
    private var lineAB = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    private var lineBC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    private var lineAC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    
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
    
    func calculate() -> (String, Double) {
        let a = self.lineBC.calculate()
        let b = self.lineAC.calculate()
        let c = self.lineAB.calculate()
        let cos = (pow(a.1, 2) + pow(c.1, 2) - pow(b.1, 2)) / (2 * a.1 * c.1)
        let sin = sqrt(1 - pow(cos, 2))
        let area = 0.5 * a.1 * c.1 * sin
        return ("삼각형 넓이는 ",area)
    }
    
    func drawPoint() -> [MyPoint] {
        return [self.lineAB.pointA, self.lineBC.pointA, self.lineAC.pointB]
    }
    
}

