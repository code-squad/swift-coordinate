//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 9. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle:MyPointConvertible, FigurePossible {
  
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
        return MyPoint(x: myLine.pointA.x, y: myLine.pointA.y)
    }
    
    func triangleAreaCalc() -> Double {
        let cos = (pow(lineBC.distanceCalc(), 2)+pow(lineAB.distanceCalc(), 2)-pow(lineAC.distanceCalc(), 2))/(2 * lineBC.distanceCalc() * lineAB.distanceCalc())
        let sin = sqrt(1-pow(cos, 2))
        let area = 1/2 * (lineBC.distanceCalc() * lineAB.distanceCalc() * sin)
        return area
    }
    
    static func verifyFigure(_ line :[MyPoint]) -> Bool {
        let lineAB = MyLine(pointA: line[0], pointB: line[1]).distanceCalc()
        let lineBC = MyLine(pointA: line[0], pointB: line[2]).distanceCalc()
        let lineAC = MyLine(pointA: line[1], pointB: line[2]).distanceCalc()
        let distances: [Double] = [lineAB,lineBC,lineAC].sorted()
        if distances[0] + distances[1] > distances[2] {
            return true
        } else { return false }
    }
    
}
