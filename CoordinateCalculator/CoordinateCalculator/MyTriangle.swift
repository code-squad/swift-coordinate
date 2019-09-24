//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    private(set) var lineAB = MyLine(x: MyPoint(), y: MyPoint())
    private(set) var lineBC = MyLine(x: MyPoint(), y: MyPoint())
    private(set) var lineAC = MyLine(x: MyPoint(), y: MyPoint())
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        lineAB = MyLine(x: pointA, y: pointB)
        lineBC = MyLine(x: pointB, y: pointC)
        lineAC = MyLine(x: pointA, y: pointC)
    }
}

extension MyTriangle: Shape {
    var vertices: [CoordinatePresentable] {
        let points = (lineAB.vertices + lineBC.vertices + lineAC.vertices) as! [MyPoint]
        let result = Array(Set(points)) as [CoordinatePresentable]
        return result
    }
    
    func extent() -> Double {
        let distanceAB = lineAB.distance()
        let distanceBC = lineBC.distance()
        let distanceAC = lineAC.distance()
        
        let cosB = (pow(distanceBC,2) + pow(distanceAB,2) - pow(distanceAC,2)) / (2*distanceBC*distanceAC)
        let sinB = sqrt(1 - pow(cosB,2))
        let result = sinB > 0 ? distanceBC * distanceAB * sinB / 2 :
                                distanceBC * distanceAC / 2
        return result
    }
}
