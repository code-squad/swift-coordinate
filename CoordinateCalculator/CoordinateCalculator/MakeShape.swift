//
//  MakeShape.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MakeShape {
    static func makeShapeByPoints(points: Array<Point>) throws -> Shapable {
        for point in points {
            guard  MyPoint.isValidInRange(point: point) else {
                throw PointValueError.invalidRange
            }
        }
        
        var shapeByPoints : Shapable!
        
        if points.count == 1 {
            let point = MyPoint(x: points[0].xPos, y: points[0].yPos)
            shapeByPoints = point as Shapable
        }
        else if points.count == 2 {
            
            guard let line = MyLine(
                pointA: MyPoint(point: points[0]),
                pointB: MyPoint(point: points[1])) else {
                    
                    throw PointValueError.samePoints
            }
            
            shapeByPoints = line as Shapable
        }
        else if points.count == 3 {
            guard let triangle = MyTriangle(
                pointA: MyPoint(point: points[0]),
                pointB: MyPoint(point: points[1]),
                pointC: MyPoint(point: points[2])) else {
                    
                throw PointValueError.samePoints
            }
            
            shapeByPoints = triangle as Shapable
        }
        else if points.count == 4 {
            
            let minXpos = points.map {$0.xPos}.min()
            let pointsHasMinXpos = points.filter {$0.xPos == minXpos}
            
            let maxYpos = points.map {$0.yPos}.max()
            let pointsHasMaxYpos = points.filter {$0.yPos == maxYpos}
            
            guard pointsHasMinXpos.count == 2 && pointsHasMaxYpos.count == 2 else {
                throw PointValueError.cantBeRectangle
            }
            
            let leftTop = points.filter {$0.xPos == minXpos && $0.yPos == maxYpos}
            let rightBottom = points.filter {$0.xPos != minXpos && $0.yPos != maxYpos}
            
            guard leftTop.count == 1 && rightBottom.count == 1 else {
                throw PointValueError.samePoints
            }
            
            let rect = MyRect(leftTop: MyPoint(point: leftTop[0]), rightBottom: MyPoint(point: rightBottom[0]))
            //let rect = MyRect(origin: MyPoint(point: points[0]), size: CGSize(width: 5, height: 5))
            
            shapeByPoints = rect as Shapable
        }
            
        else {
            throw PointValueError.invalidFormat
        }
        
        return shapeByPoints
    }
}
