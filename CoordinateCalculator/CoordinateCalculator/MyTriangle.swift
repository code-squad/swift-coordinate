//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    private(set) var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private(set) var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private(set) var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        //로직 구현
    }
    
    func areaTriangle() -> Double {
        let a = lineAB.distance()
        let b = lineBC.distance()
        let c = lineAC.distance()
        let cos = ( pow(a, 2.0) + pow(b, 2.0) - pow(c, 2.0) ) / (2.0 * a * b)
        let sin = sqrt(1.0 - pow(cos, 2.0))
        let area = (a * b * sin) / 2
        return area
    }
    
}
