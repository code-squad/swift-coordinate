//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Drawable {
    private (set) var points: [MyPoint]
    private (set) var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private (set) var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private (set) var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private var size: Double {
        let s = (lineAB.shapeValue + lineAC.shapeValue + lineBC.shapeValue) / 2
        return sqrt(s * (s - lineAB.shapeValue) * (s - lineAC.shapeValue) * (s - lineBC.shapeValue))
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointC, pointB: pointA)
        self.points = [pointA,pointB,pointC]
    }
}

extension MyTriangle: Explanation {
    var explanation: String {
        return ExplanationType.triangle.description
    }
    var shapeValue: Double {
        return self.size
    }
}

