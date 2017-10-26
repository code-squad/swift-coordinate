//
//  File.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 26..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureStore {
    
    func convertArrayToFigure(_ points: [MyPoint]) throws -> Figure {
        switch points.count {
        case 1:
            let point = MyPoint(x: points[0].x, y: points[0].y)
            return point
        case 2:
            let line = MyLine(
                pointA: points[0],
                pointB: points[1])
            return line
        case 3:
            if !MyTriangle.isTriangle(points) {
                throw InputError.cannotMakeTriangle
            }
            let triangle = MyTriangle(
                pointA: points[0],
                pointB: points[1],
                pointC: points[2])
            return triangle
        case 4:
            if !MyRect.isRect(points) {
                throw InputError.cannotMakeRect
            }
            let sortedPoints = points.sorted()
            let width = sortedPoints[2].x-sortedPoints[0].x
            let height = sortedPoints[1].y-sortedPoints[0].y
            let rect = MyRect(
                origin: MyPoint(x: sortedPoints[1].x,
                                y: sortedPoints[1].y),
                size: CGSize(width: CGFloat(width),
                             height: CGFloat(height)))
            return rect
        default: break
        }
        throw InputError.outOfCoordinate
    }
    
}
