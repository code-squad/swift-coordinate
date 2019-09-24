//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by junwoo on 2019/09/24.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    var lineAB: MyLine
    var lineBC: MyLine
    var lineAC: MyLine
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
    
    static func area(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) -> Double {
        return 1/2*Double((pointB.y + pointA.y)*(pointB.x - pointA.x))
            + 1/2*Double((pointB.y + pointC.y)*(pointC.x - pointB.x))
            - 1.2*Double((pointA.y + pointC.y)*(pointC.x - pointA.x))
    }
}

extension MyTriangle: ValidIdentiable {
    var isValid: Bool {
        return lineAB.isValid && lineBC.isValid && lineAC.isValid
    }
}
