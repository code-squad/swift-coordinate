//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 10..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    private(set) var pointA: MyPoint
    private(set) var pointB: MyPoint
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
}

extension MyLine: Figurable {
    init(points: [MyPoint]) {
        self.pointA = points[0]
        self.pointB = points[1]
    }
    
    func calculate() -> Double {
        return calculateDistance()
    }
    
    private func calculateDistance() -> Double {
        let pointX = pow(Double(abs(pointA.x - pointB.x)), 2)
        let pointY = pow(Double(abs(pointA.y - pointB.y)), 2)
        return sqrt(pointX + pointY)
    }
    
    var points: [MyPoint] {
        return [pointA, pointB]
    }
}
