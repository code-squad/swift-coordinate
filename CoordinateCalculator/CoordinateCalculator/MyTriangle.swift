//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 23..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Shape, Measurable {
    private let lineAB: MyLine
    private let lineBC: MyLine
    private let lineAC: MyLine
    var points: [MyPoint]
    
    init?(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        guard let lineAB = MyLine(pointA: pointA, pointB: pointB),
            let lineBC = MyLine(pointA: pointB, pointB: pointC),
            let lineAC = MyLine(pointA: pointA, pointB: pointC),
            lineAB != lineBC || lineBC != lineAC || lineAC != lineAB else {
                return nil
        }
        self.lineAB = lineAB
        self.lineBC = lineBC
        self.lineAC = lineAC
        self.points = [pointA, pointB, pointC]
    }
    
    func area() -> Double {
        let sum = (lineAB.area() + lineBC.area() + lineAC.area()) / 2
        return sqrt(sum * (sum - lineAB.area()) * (sum - lineBC.area()) * (sum - lineAC.area()))
    }
}
