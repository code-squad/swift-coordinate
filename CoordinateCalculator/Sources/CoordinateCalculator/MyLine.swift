//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    
    private(set) var pointA: MyPoint
    private(set) var pointB: MyPoint
    
    init() {
        pointA = MyPoint()
        pointB = MyPoint()
    }
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
}

// MARK: Method
extension MyLine {
    // 거리, 소숫점 8자리 까지
    func distance() -> Double {
        let temp = pow(Double(pointA.x - pointB.x), 2.0) + pow(Double(pointA.y - pointB.y), 2.0)
        var result = sqrt(temp)
        return result.roundToPlaces(places: 8)
    }
}

extension MyLine: Figure {
    func calculator() -> (String, Double)? {
        return ("두 점 사이 거리는 ", distance() )
    }
}

extension Double {
    mutating func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        let result = Darwin.round(self * divisor) / divisor
        return result
    }
}
