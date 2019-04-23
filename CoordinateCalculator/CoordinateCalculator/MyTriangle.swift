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
        self.lineAB.pointA.x = x[0]
        self.lineAB.pointB.x = x[1]
        self.lineAB.pointA.y = y[0]
        self.lineAB.pointB.y = y[1]
        
        self.lineBC.pointA.x = x[1]
        self.lineBC.pointB.x = x[2]
        self.lineBC.pointA.y = y[1]
        self.lineBC.pointB.y = y[2]
        
        self.lineAC.pointA.x = x[0]
        self.lineAC.pointB.x = x[2]
        self.lineAC.pointA.y = y[0]
        self.lineAC.pointB.y = y[2]
        
        self.area = calculateArea()
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB.pointA = pointA
        self.lineAB.pointB = pointB
        self.lineBC.pointA = pointB
        self.lineBC.pointB = pointC
        self.lineAC.pointA = pointA
        self.lineAC.pointB = pointC
        
        self.area = calculateArea()
    }
    
    private func calculateArea () -> Double {
        return (lineAB.length + lineBC.length + lineAC.length)/2.0
    }
}
