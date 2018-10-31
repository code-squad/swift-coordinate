//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation


struct MyLine: Computable {
    
    private(set) var pointA: MyPoint
    private(set) var pointB: MyPoint
    
    init(coordinateArray: [Int]) {
        self.pointA = MyPoint(x: coordinateArray[0], y: coordinateArray[1])
        self.pointB = MyPoint(x: coordinateArray[2], y: coordinateArray[3])
    }
    
    func computeDistance(of line: MyLine) -> Double {
        let xDistance = (line.pointA.x - line.pointB.x)
        let yDistatnce = (line.pointA.y - line.pointB.y)
        let lineDistance = sqrt(square(of: xDistance) + square(of: yDistatnce))
        return lineDistance
    }
    
    
    }

