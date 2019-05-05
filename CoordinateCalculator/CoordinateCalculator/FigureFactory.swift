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
        var initializer : ([PointTuple])throws->Figure
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
    
    private func createRect(points:[PointTuple])throws->MyRect{
        let myPoints = points.map{
            point in
             MyPoint.init(point)
        }
        guard MyRect.isRectFormat(points: myPoints) else {
            throw Exception.ErrorType.notFigureFormat
        }
        return MyRect.init(pointA: myPoints[0],pointB:myPoints[1],pointC:myPoints[2], pointD:myPoints[3])
    }
}
