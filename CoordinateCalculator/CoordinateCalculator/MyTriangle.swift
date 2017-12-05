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
        lineAC = MyLine(pointA: pointC, pointB: pointA)
    }
    
    init (points: [MyPoint]) {
        lineAB = MyLine(pointA: points[0], pointB: points[1])
        lineBC = MyLine(pointA: points[1], pointB: points[2])
        lineAC = MyLine(pointA: points[2], pointB: points[0])
    }
    
    private func getLine (_ line: MyLine) -> MyPoint {
        return MyPoint(x: line.pointA.x, y: line.pointA.y)
    }
    
    func makeCoordinates() -> [MyPoint] {
        return [getLine(lineAB),
                         getLine(lineBC),
                         getLine(lineAC)]
    }
    
    func calculate() -> Double {
        return sqrt(Double(1) - pow((pow(lineBC.calculate(), 2) + pow(lineAB.calculate(), 2) - pow(lineAC.calculate(), 2))
            / (2 * lineBC.calculate() * lineAB.calculate()), 2)) * lineBC.calculate() * lineAB.calculate() / 2
    }
    
    var resultDescription: String = {
        return "삼각형의 면적은 : "
    }()
    
    static func isPerpectTriangle(_ points: [MyPoint]) -> Bool {
        if (points[0].x == points[1].x && points[0].y == points[1].y) ||
              (points[1].x == points[2].x && points[1].y == points[2].y) ||
              (points[2].x == points[0].x && points[2].y == points[0].y)
        { return false }
        return true
    }
}
