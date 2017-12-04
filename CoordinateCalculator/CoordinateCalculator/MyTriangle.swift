//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 12. 4..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: MyShape, ShapeCalculation {
    private var lineAB = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    private var lineBC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    private var lineAC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        lineAB = MyLine(pointA: pointA, pointB: pointB)
        lineBC = MyLine(pointA: pointB, pointB: pointC)
        lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
    
    private func getLine (_ line: MyLine) -> MyPoint {
        return MyPoint(x: line.pointA.x, y: line.pointB.y)
    }
    
    func makeCoordinates() -> [MyPoint] {
        return [getLine(lineAB), getLine(lineBC), getLine(lineAC)]
    }
    
    func calculate() -> Double {
        return sqrt(Double(1) - pow((pow(self.lineBC.calculate(), 2) + pow(self.lineAB.calculate(), 2) - pow(self.lineAC.calculate(), 2))
            / (2 * self.lineBC.calculate() * self.lineAB.calculate()), 2)) * self.lineBC.calculate() * self.lineAB.calculate() / 2
    }
    
    var resultDescription: String = {
        return "삼각형의 면적은 : "
    }()
    
}
