//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Drawable, Measurable {
    func calculate() -> Double {
        let x = pow(Double(pointA.x - pointB.x), 2)
        let y = pow(Double(pointA.y - pointB.y), 2)
        
        return sqrt(x + y)
    }
    
    func point() -> [MyPoint] {
        let linePoint = [pointA, pointB]
        
        return linePoint
    }
    
    private(set) var pointA: MyPoint
    private(set) var pointB: MyPoint
    private(set) var length: Double
    var unit: String
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
        length = 0
        unit = ""
            
        length = calculate()
        unit = MeasurableUnit.length.rawValue
    }
}
