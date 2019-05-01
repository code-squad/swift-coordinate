//
//  DrawableFactory.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory{
    
    func createFigure(type:FigureType,points:[PointTuple]) throws ->Figure{
        switch type {
        case .none:
            throw Exception.ErrorType.wrongFormat
        case .point:
            return createPoint(points: points)
        case .line :
            return createLine(points: points)
        case .triangle:
            return createTriangle(points: points)
        }
    }
    
    func createPoint(points:[PointTuple])->MyPoint{
        return MyPoint.init(points[0])
    }
    
    func createLine(points:[PointTuple])->MyLine{
        let pointA = createPoint(points:[points[0]])
        let pointB = createPoint(points:[points[1]])
        return MyLine.init(pointA,pointB)
    }
    
    func createTriangle(points:[PointTuple])->MyTriangle{
        let pairAB =  pair(points: points, indexA: 0, indexB: 1)
        let pairBC =  pair(points: points, indexA: 1, indexB: 2)
        let pairAC =  pair(points: points, indexA: 0, indexB: 2)
        let lineAB = createLine(points: pairAB)
        let lineBC = createLine(points: pairBC)
        let lineAC = createLine(points: pairAC)
        return MyTriangle.init(lineAB: lineAB, lineBC: lineBC, lineAC: lineAC)
        
    }
    
    func pair(points:[PointTuple],indexA:Int,indexB:Int)->[PointTuple]{
        var pairedPoints = [PointTuple]()
        pairedPoints.append(points[indexA])
        pairedPoints.append(points[indexB])
        return pairedPoints
    }
    
}
