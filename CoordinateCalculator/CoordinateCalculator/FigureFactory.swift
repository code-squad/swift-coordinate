//
//  DrawableFactory.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory{
    
    func createFigure(points:[PointTuple]) throws ->Figure{
        var initializer : ([PointTuple])->Figure
        switch points.count {
        case 1:
            initializer = createPoint(points:)
        case 2:
            initializer = createLine(points:)
        case 3:
            initializer = createTriangle(points:)
        default:
            throw Exception.ErrorType.wrongFormat
        }
        return initializer(points)
    }
    
    private func createPoint(points:[PointTuple])->MyPoint{
        return MyPoint.init(points[0])
    }
    
    private func createLine(points:[PointTuple])->MyLine{
        let pointA = createPoint(points:[points[0]])
        let pointB = createPoint(points:[points[1]])
        return MyLine.init(pointA,pointB)
    }
    
    private func createTriangle(points:[PointTuple])->MyTriangle{
       return MyTriangle.init(pointA: MyPoint(points[0]), pointB: MyPoint(points[1]), pointC: MyPoint(points[2]))
        
    }
}
