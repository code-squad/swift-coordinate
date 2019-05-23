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
    
    init?(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        guard let lineAB = MyLine(pointA: pointA, pointB: pointB),
            let lineBC = MyLine(pointA: pointA, pointB: pointB),
            let lineAC = MyLine(pointA: pointA, pointB: pointB),
            lineAB != lineBC || lineBC != lineAC || lineAC != lineAB else {
                return nil
        }
        self.lineAB = lineAB
        self.lineBC = lineBC
        self.lineAC = lineAC
    }
    
    func points() -> [MyPoint] {
        return lineAB.points() + lineBC.points() + lineAC.points()
    }
    
    func area() -> Double {
        let sum = (lineAB.area() + lineBC.area() + lineAC.area()) / 2
        return sqrt(sum * (sum - lineAB.area()) * (sum - lineBC.area()) * (sum - lineAC.area()))
    }
}
