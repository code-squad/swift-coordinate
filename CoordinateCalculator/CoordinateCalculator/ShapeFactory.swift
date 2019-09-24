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
    
    static private func createLine( points: [(x: Int, y: Int)]) -> MyLine {
        let pointA = MyPoint(x: points[0].x, y: points[0].y)
        let pointB = MyPoint(x: points[1].x, y: points[1].y)
        return MyLine(x: pointA, y: pointB)
    }
    
    static private func createTriangle( points: [(x: Int, y: Int)]) -> MyTriangle {
        let pointA = MyPoint(x: points[0].x, y: points[0].y)
        let pointB = MyPoint(x: points[1].x, y: points[1].y)
        let pointC = MyPoint(x: points[2].x, y: points[2].y)
        return MyTriangle(pointA: pointA, pointB: pointB, pointC: pointC)
    }
    
    static private func createRect(points: [(x: Int, y: Int)]) -> MyRect {
        let points = [MyPoint(x: points[0].x, y: points[0].y),
                      MyPoint(x: points[1].x, y: points[1].y),
                      MyPoint(x: points[2].x, y: points[2].y),
                      MyPoint(x: points[3].x, y: points[3].y)]
        return MyRect(points: points)
    }
    
    static private func createShape(points: [(x: Int, y: Int)]) -> Shape {
        var shape: Shape
        switch points.count {
        case 1:
            shape = MyPoint(x: points[0].x, y: points[0].y)
        case 2:
            shape = createLine(points: points)
        case 3:
            shape = createTriangle(points: points)
        case 4:
            shape = createRect(points: points)
            
        default:
            // Will test Later ater implementing step-3 requrement
            shape = MyPoint(x: points[0].x, y: points[0].y)
        }
        return shape
    }
}
