//
//  MakePoint.swift
//  CoordinateCalculator
//
//  Created by JH on 24/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeMaker {

    static func makeShape(from coordinate: [(x: Int, y: Int)]) -> DrawableShape? {
        switch coordinate.count {
        case 1:
            return MyPoint(x: coordinate[0].x, y: coordinate[0].y)
        case 2:
            return MyLine(pointA: MyPoint(x: coordinate[0].x, y: coordinate[0].y), pointB: MyPoint(x: coordinate[1].x, y: coordinate[1].y))
        default:
            return nil
        }
    }
}
