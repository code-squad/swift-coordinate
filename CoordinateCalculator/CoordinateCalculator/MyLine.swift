//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by JH on 25/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: DrawableShape, SimplyDescribable {
    
    private (set) var startPoint: MyPoint
    private (set) var endPoint: MyPoint
    
    var drawablePoints: [MyPoint] {
        return [startPoint, endPoint]
    }
    
    
    func distance() -> Double {
        return sqrt(pow(Double(startPoint.x - endPoint.x), 2) + pow(Double(startPoint.y - endPoint.y), 2))
    }
    

    var simpleDescription: String {
        return "두 점 사이 거리는 \(distance())"
    }
    
}
/*
 pow(<#T##Double#>, <#T##Double#>)
 pow(제곱당하는 수, 하려고하는 제곱의 수)
 */

