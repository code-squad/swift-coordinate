//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation


struct MyLine: MyFigure {
    
    var points: [MyPoint] {return [self.pointA, self.pointB] }
    private(set) var pointA: MyPoint
    private(set) var pointB: MyPoint
    var calculatedResult: Double? {
        return computeDistance(of: self.pointA, to: self.pointB)
    }
    
    init(coordinateArray: [Int]) {
        self.pointA = MyPoint(x: coordinateArray[0], y: coordinateArray[1])
        self.pointB = MyPoint(x: coordinateArray[2], y: coordinateArray[3])
    }
    
    func computeDistance(of from: MyPoint, to: MyPoint ) -> Double {
        let xDistance = (from.x - to.x)
        let yDistatnce = (from.y - to.y)
        let lineDistance = sqrt(square(of: xDistance) + square(of: yDistatnce))
        return lineDistance
    }
}

