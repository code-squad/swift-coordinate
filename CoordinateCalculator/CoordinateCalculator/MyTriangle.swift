//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/23/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Figure {
    var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
    var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    var area = 0.0
    
    init(x: [Int], y: [Int]) {
        self.lineAB = MyLine(x: [ x[0], x[1] ], y: [ y[0], y[1] ])
        self.lineBC = MyLine(x: [ x[1], x[2] ], y: [ y[1], y[2] ])
        self.lineAC = MyLine(x: [ x[0], x[2] ], y: [ y[0], y[2] ])
        self.area = calculateArea()
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
        self.area = calculateArea()
    }
    
    private func calculateArea () -> Double {
        let halfPerimeter = (lineAB.length + lineBC.length + lineAC.length)/2.0

        return sqrt(halfPerimeter * (halfPerimeter-lineAB.length) * (halfPerimeter-lineBC.length) * (halfPerimeter-lineAC.length))
    }
}
