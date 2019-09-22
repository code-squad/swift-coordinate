//
//  ShapeFactory.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeFactory {
    
    static func createShape(verticeProvider: VertexProvidable) throws -> Shape {
        do {
            let points = try verticeProvider.readVertices()
            return createShape(points: points)
        }
        catch let e {
            throw e
        }
    }
    
    static private func createShape(points: [(x: Int, y: Int)]) -> Shape {
        var shape: Shape
        switch points.count {
        case 1:
            shape = MyPoint(x: points[0].x, y: points[0].y)
        case 2:
            let pointA = MyPoint(x: points[0].x, y: points[0].y)
            let pointB = MyPoint(x: points[1].x, y: points[1].y)
            shape = MyLine(x: pointA, y: pointB)
        default:
            // Will test Later ater implementing step-3 requrement
            shape = MyPoint(x: points[0].x, y: points[0].y)
        }
        return shape
    }
}
