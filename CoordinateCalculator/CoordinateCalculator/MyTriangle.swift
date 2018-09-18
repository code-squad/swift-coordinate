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
        let ABPoints = lineAB.convertMyPoint()
        let ACPoints = lineAC.convertMyPoint()
        return [ABPoints[0],ABPoints[1],ACPoints[0]]
    }
    
    private var lineAB: MyLine
    private var lineBC: MyLine
    private var lineAC: MyLine
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointC, pointB: pointA)
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
