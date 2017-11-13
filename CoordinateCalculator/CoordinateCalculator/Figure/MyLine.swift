//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 10..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Figurable {
    private(set) var pointA: MyPoint
    private(set) var pointB: MyPoint
    var points: [MyPoint]
    
    init(points: [MyPoint]) {
        self.pointA = points[0]
        self.pointB = points[1]
        self.points = points
    }
    
    func calculate() -> Double {
        return calculateDistance()
    }

    private func calculateDistance() -> Double {
        let pointX = pow(Double(abs(pointA.x - pointB.x)), 2)
        let pointY = pow(Double(abs(pointA.y - pointB.y)), 2)
        return sqrt(pointX + pointY)
    }
}
