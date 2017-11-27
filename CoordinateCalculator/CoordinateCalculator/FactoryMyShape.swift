//
//  FactoryMyShape.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 24..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct FactoryMyShape {

    func makeShape (_ myPoints: [MyPoint]) -> MyShape {
        switch myPoints.count {
        case 1:
            return MyPoint(x: myPoints[0].x, y: myPoints[0].y)
        case 2:
            return MyLine(pointA: myPoints[0], pointB: myPoints[1])
        default:
            return MyPoint(x: myPoints[0].x, y: myPoints[0].y)}
    }
}

protocol MyShape {
    func calculate() -> Double
}
