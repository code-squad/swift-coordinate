//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    var lineAB = MyLine(x: MyPoint(), y: MyPoint())
    var lineBC = MyLine(x: MyPoint(), y: MyPoint())
    var lineAC = MyLine(x: MyPoint(), y: MyPoint())
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        lineAB = MyLine(x: pointA, y: pointB)
        lineBC = MyLine(x: pointB, y: pointC)
        lineAC = MyLine(x: pointA, y: pointC)
    }
    
    var extent: Double {
        let cosB = (pow(lineBC.distance,2) + pow(lineAB.distance,2) - pow(lineAC.distance,2))
                    / (2*lineBC.distance*lineAC.distance)
        let sinB = sqrt(1 - pow(cosB,2))
        let result = sinB > 0 ? lineBC.distance * lineAB.distance * sinB / 2 :
                                lineBC.distance * lineAC.distance / 2
        return result
    }
}

extension MyTriangle: Shape {
    var vertices: [CoordinatePresentable] {
        let points = (lineAB.vertices + lineBC.vertices + lineAC.vertices) as! [MyPoint]
        let result = Array(Set(points)) as [CoordinatePresentable]
        return result
    }
    
    var description: String? {
        return "삼각형의 넓이는 \(extent)"
    }
}
