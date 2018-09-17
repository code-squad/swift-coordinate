//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 9. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle:MyPointConvertible, FigurePossible, FigureCalculation {
    func convertMyPoint() -> [MyPoint] {
        return  [convert(myLine: lineAB), convert(myLine: lineBC), convert(myLine: lineAC)]
    }
  
    private var lineAB: MyLine
    private var lineBC: MyLine
    private var lineAC: MyLine
    
    init(points: [MyPoint]) {
        self.lineAB = MyLine(pointA: points[0], pointB: points[1])
        self.lineBC = MyLine(pointA: points[1], pointB: points[2])
        self.lineAC = MyLine(pointA: points[2], pointB: points[0])
    }
    
    func convert(myLine: MyLine) -> MyPoint {
        return MyPoint(x: myLine.pointAB[0].x, y: myLine.pointAB[1].y)
    }
    
    static func verifyFigure(_ line :[MyPoint]) -> Bool {
        let lineAB = MyLine(pointA: line[0], pointB: line[1]).calculate()
        let lineBC = MyLine(pointA: line[0], pointB: line[2]).calculate()
        let lineAC = MyLine(pointA: line[1], pointB: line[2]).calculate()
        let distances: [Double] = [lineAB,lineBC,lineAC].sorted()
        if distances[0] + distances[1] > distances[2] {
            return true
        } else { return false }
    }
    
    func calculate() -> Double {
        let cos = (pow(lineBC.calculate(), 2)+pow(lineAB.calculate(), 2)-pow(lineAC.calculate(), 2))/(2 * lineBC.calculate() * lineAB.calculate())
        let sin = sqrt(1-pow(cos, 2))
        let area = 1/2 * (lineBC.calculate() * lineAB.calculate() * sin)
        return area
    }
    
    var description: String = {
        return "삼각형 넓이는 : "
    }()
    
}
