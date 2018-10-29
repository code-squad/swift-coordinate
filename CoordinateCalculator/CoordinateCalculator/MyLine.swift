//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    
    private(set) var pointA: MyPoint
    private(set) var pointB: MyPoint
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    func computeDistance(of line: MyLine) -> Double {
        let xDistance = (line.pointA.x - line.pointB.x)
        let yDistatnce = (line.pointA.y - line.pointB.y)
        let lineDistatnce = sqrt(square(of: xDistance) + square(of: yDistatnce))
        return lineDistatnce
    }
    
    private func square(of number: Int) -> Double {
        return Double(number * number)
    }
}
