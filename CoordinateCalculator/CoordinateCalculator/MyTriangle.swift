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
  
    private var lineAB = MyLine(pointA: MyPoint(x:0 ,y:0), pointB: MyPoint(x:0 ,y:0))
    private var lineBC = MyLine(pointA: MyPoint(x:0 ,y:0), pointB: MyPoint(x:0 ,y:0))
    private var lineAC = MyLine(pointA: MyPoint(x:0 ,y:0), pointB: MyPoint(x:0 ,y:0))
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointC, pointB: pointA)
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
    
    static func figureVerify(_ line :[MyPoint]) -> Bool {
        let lineAB = MyLine(pointA: line[0], pointB: line[1]).distanceCalc()
        let lineBC = MyLine(pointA: line[0], pointB: line[2]).distanceCalc()
        let lineAC = MyLine(pointA: line[1], pointB: line[2]).distanceCalc()
        let distances: [Double] = [lineAB,lineBC,lineAC].sorted()
        if distances[0] + distances[1] > distances[2] {
            return true
        } else { return false }
    }
    
}
