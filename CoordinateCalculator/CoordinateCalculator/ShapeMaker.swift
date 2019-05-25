//
//  MakePoint.swift
//  CoordinateCalculator
//
//  Created by JH on 24/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeMaker {

    static func makeShape(points: [(x: Int, y: Int)]) -> Drawable? {
        switch points.count {
        case 1:
            return MyPoint(x: points[0].x, y: points[0].y)
        case 2:
            return MyLine(pointA: MyPoint(x: points[0].x, y: points[0].y), pointB: MyPoint(x: points[1].x, y: points[1].y))
        default:
            return nil
        }
    }
}
