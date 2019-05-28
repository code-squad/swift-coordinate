//
//  MakePoint.swift
//  CoordinateCalculator
//
//  Created by JH on 24/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeMaker {

    static func makeShape(from coordinates: [(x: Int, y: Int)]) -> DrawableShape? {
        switch coordinates.count {
        case 1:
            return MyPoint(x: coordinates[0].x, y: coordinates[0].y)
        case 2:
            return MyLine(startPoint: MyPoint(x: coordinates[0].x, y: coordinates[0].y), endPoint: MyPoint(x: coordinates[1].x, y: coordinates[1].y))
        case 3:
            return MyTriangle(pointA: MyPoint(x: coordinates[0].x, y: coordinates[0].y), pointB: MyPoint(x: coordinates[1].x, y: coordinates[1].y), pointC: MyPoint(x: coordinates[2].x, y: coordinates[2].y))
        default:
            return nil
        }
    }
}
