//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 15/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: CalculableShape {
    private var lineAB = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    private var lineBC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    private var lineAC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
    
    var points: [MyPoint] {
        return [lineAB.pointA, lineAB.pointB, lineAC.pointB]
    }
    
    var calculationMessage: String {
        return "삼각형의 넓이는"
    }
    
    func calculate() -> Double {
        let a = lineBC.calculate()
        let b = lineAC.calculate()
        let c = lineAB.calculate()
        let cos = (pow(a, 2) + pow(c, 2) - pow(b, 2)) / (2 * a * c)
        let sin = sqrt(1 - pow(cos, 2))
        return 0.5 * a * c * sin
    }
}
