//
//  MakePoint.swift
//  CoordinateCalculator
//
//  Created by JH on 24/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeMaker {

    static func makeShape(fromCoordinateValues coordinateValues: [(x: Int, y: Int)]) -> DrawableShape? {
        switch coordinateValues.count {
        case 1:
            return MyPoint(x: coordinateValues[0].x, y: coordinateValues[0].y)
        case 2:
            return MyLine(pointA: MyPoint(x: coordinateValues[0].x, y: coordinateValues[0].y), pointB: MyPoint(x: coordinateValues[1].x, y: coordinateValues[1].y))
        default:
            return nil
        }
    }
}
