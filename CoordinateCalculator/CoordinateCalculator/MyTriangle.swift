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
    
    init(x: Int = 0, y: Int = 0) {
        self.lineAB = MyLine(x: x, y: y)
        self.lineBC = MyLine(x: x, y: y)
        self.lineAC = MyLine(x: x, y: y)
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
