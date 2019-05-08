//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 02/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    private var lineAB: MyLine
    private var lineBC: MyLine
    private var lineAC: MyLine
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        lineAB = MyLine(pointA: pointA, pointB: pointB)
        lineBC = MyLine(pointA: pointB, pointB: pointC)
        lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
}

extension MyTriangle: AxisDrawable {
    var points: [MyPoint] {
        let pointSet = Set(lineAB.points).union(Set(lineAC.points))
        return Array(pointSet)
    }
}

extension MyTriangle: ValueComputable {
    var descriptionOfComputedValue: String {
        return "삼각형의 넓이는 "
    }
    
    func getComputedValue() -> Double {
        return computeArea()
    }
    
    private func computeArea() -> Double {
        let a = lineBC.getComputedValue()
        let b = lineAC.getComputedValue()
        let c = lineAB.getComputedValue()
        let cosB = (pow(a, 2) + pow(c, 2) - pow(b, 2)) / (2.0 * a * c)
        let sinB = sqrt(1-pow(cosB, 2))
        let area = 0.5 * a * c * sinB
        return area
    }
}
