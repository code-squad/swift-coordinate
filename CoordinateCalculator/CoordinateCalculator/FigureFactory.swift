//
//  DrawableFactory.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory{
    
    func createFigure(points:[PointTuple]) throws -> Figure {
        var initializer : ([PointTuple]) throws -> Figure
        switch points.count {
        case 1:
            initializer = createPoint(points:)
        case 2:
            initializer = createLine(points:)
        case 3:
            initializer = createTriangle(points:)
        case 4:
            initializer = createRect(points:)
        default:
            throw Exception.ErrorType.wrongFormat
        }
        return try initializer(points)
    }
    
    
    private func tuplesToPoints(tuples:[PointTuple]) -> [MyPoint] {
        let myPoints = tuples.map{MyPoint.init($0)}
        
        return myPoints
    }
    
    private func createPoint(points:[PointTuple]) -> MyPoint {
        let myPoints = tuplesToPoints(tuples: points)
        
        return myPoints[0]
    }
    
    
    private func createLine(points:[PointTuple]) -> MyLine {
        let myPoints = tuplesToPoints(tuples: points)
        
        return MyLine.init(myPoints[0],myPoints[1])
    }
    
    private func createTriangle(points:[PointTuple]) -> MyTriangle {
        let myPoints = tuplesToPoints(tuples: points)
        
        return MyTriangle.init(pointA: myPoints[0], pointB: myPoints[1], pointC: myPoints[2])
    }
    
    private func createRect(points:[PointTuple]) throws -> MyRect {
        let myPoints = tuplesToPoints(tuples: points)
        
        guard MyRect.isRectFormat(points: myPoints) else {
            throw Exception.ErrorType.notFigureFormat
        }
        
        return MyRect.init(pointA: myPoints[0],pointB:myPoints[1],pointC:myPoints[2], pointD:myPoints[3])
    }
}
