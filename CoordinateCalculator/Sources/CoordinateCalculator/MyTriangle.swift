//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 31..
//

import Foundation

struct MyTriangle{
    var lineAB = MyLine()
    var lineBC = MyLine()
    var lineAC = MyLine()
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
}

extension MyTriangle: FigureCalculatable{
    func calculate() -> Double{
        let lengthOfLineAB = self.lineAB.calculate()
        let lengthOfLineBC = self.lineBC.calculate()
        let lengthOfLineAC = self.lineAC.calculate()
        var cosB = (Int(lengthOfLineAB)^2 + Int(lengthOfLineBC)^2 - Int(lengthOfLineAC)^2)
        cosB /= 2*Int(lengthOfLineAB)*Int(lengthOfLineBC)
        let sinB = sqrt(Double(1-cosB^2))
        return 1/2 * lengthOfLineAB * lengthOfLineBC * sinB
    }
}

