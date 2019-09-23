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
        var shapeByPoints : Shapable!
        
        if points.count == 1 {
            let point = MyPoint(x: points[0].xPos, y: points[0].yPos)
            shapeByPoints = point as Shapable
        }
        else if points.count == 2 {
            
            guard let line = MyLine(
                pointA: MyPoint(x: points[0].xPos, y: points[0].yPos),
                pointB: MyPoint(x: points[1].xPos, y: points[1].yPos)) else {
                    
                    throw PointValueError.samePoints
            }
            
            shapeByPoints = line as Shapable
        }
        else {
            throw PointValueError.invalidFormat
        }
        
        return shapeByPoints
    }
}
