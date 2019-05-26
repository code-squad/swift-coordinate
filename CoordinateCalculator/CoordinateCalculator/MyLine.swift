//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by JH on 25/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: DrawableShape {
    
    var pointA: MyPoint
    var pointB: MyPoint
    
    func drawablePoints() -> [MyPoint] {
        return [pointA, pointB]
    }
    
    
    func distance() -> Double {
        return sqrt(pow(Double(pointA.x - pointB.x), 2) + pow(Double(pointA.y - pointB.y), 2))
    }
    
}
/*
 pow(<#T##Double#>, <#T##Double#>)
 pow(제곱당하는 수, 하려고하는 제곱의 수)
 */

