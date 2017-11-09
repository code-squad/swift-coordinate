//
//  File.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    var pointA: MyPoint
    var pointB: MyPoint
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }

    func calcurateDistanceTwoPoints() -> Double {
        let differentialX = Double(pointA.x - pointB.x)
        let differentialY = Double(pointA.y - pointB.y)
        let resultDistance = sqrt(Double(pow(differentialX, 2) + pow(differentialY, 2)))
        return resultDistance
    }
    
}
