//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Drawable, Measurable {
    private(set) var lineAB: MyLine
    private(set) var lineBC: MyLine
    private(set) var lineAC: MyLine
    
    private let trianglePoint: [MyPoint]
    
    func point() -> [MyPoint] {
        return trianglePoint
    }
    
    var unit: MeasurableUnit {
        return .triangle
    }
    
    var value: Double {
        let cos = (pow(lineBC.value, 2) + pow(lineAB.value, 2) - pow(lineAC.value, 2)) / ( 2 * lineBC.value * lineAB.value)
        let sin = sqrt(1 - pow(cos, 2))
        
        let result = 0.5 * lineBC.value * lineAB.value * sin
        
        return result
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        lineAB = MyLine(pointA: pointA, pointB: pointB)
        lineBC = MyLine(pointA: pointB, pointB: pointC)
        lineAC = MyLine(pointA: pointA, pointB: pointC)
        
        trianglePoint = [pointA, pointB, pointC]
    }
}
