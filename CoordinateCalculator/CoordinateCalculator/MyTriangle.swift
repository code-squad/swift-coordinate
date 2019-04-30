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
    
    func point() -> [MyPoint] {
        let pointA = lineAB.pointA
        let pointB = lineAB.pointB
        let pointC = lineAC.pointB
        
        return [pointA, pointB, pointC]
    }
    
    var shapeState: ShapeStateText {
        return .triangle
    }
    
    var measuredValue: Double {
        let lineABLength = lineAB.measuredValue
        let lineBCLength = lineBC.measuredValue
        let lineACLength = lineAC.measuredValue
        
        let cos = (pow(lineBCLength, 2) + pow(lineABLength, 2) - pow(lineACLength, 2)) / ( 2 * lineBCLength * lineABLength)
        let sin = sqrt(1 - pow(cos, 2))
        
        let result = 0.5 * lineBCLength * lineABLength * sin
        
        return result
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        lineAB = MyLine(pointA: pointA, pointB: pointB)
        lineBC = MyLine(pointA: pointB, pointB: pointC)
        lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
}
