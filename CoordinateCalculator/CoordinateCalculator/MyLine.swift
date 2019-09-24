//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by RENO1 on 24/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    private var pointA:MyPoint
    private var pointB:MyPoint
    
    init(point1:MyPoint, point2:MyPoint) {
        self.pointA = point1
        self.pointB = point2
    }
}

protocol DistanceCalculatable {
    func calculateLineLength() -> Double
}

extension MyLine : DistanceCalculatable {
    func calculateLineLength() -> Double {
        let x = pointA.getX() - pointB.getX()
        let y = pointA.getX() - pointB.getX()
        return sqrt(Double(x * x + y * y))
    }
}

