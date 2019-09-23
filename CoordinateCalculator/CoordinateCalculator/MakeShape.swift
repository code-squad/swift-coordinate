//
//  MakeShape.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MakeShape {
    static func makeShapeByPoints(xyPosTupleArray: Array<XYPosTuple>) throws -> ShapeByPoints {
        var shapeByPoints : ShapeByPoints!
        
        if xyPosTupleArray.count == 1 {
            let point = MyPoint(x: xyPosTupleArray[0].xPos, y: xyPosTupleArray[0].yPos)
            shapeByPoints = point as ShapeByPoints
        }
        else if xyPosTupleArray.count == 2 {
            
            guard let line = MyLine(
                pointA: MyPoint(x: xyPosTupleArray[0].xPos, y: xyPosTupleArray[0].yPos),
                pointB: MyPoint(x: xyPosTupleArray[1].xPos, y: xyPosTupleArray[1].yPos)) else {
                    
                    throw PointValueError.samePoints
            }
            
            shapeByPoints = line as ShapeByPoints
        }
        else {
            throw PointValueError.invalidFormat
        }
        
        return shapeByPoints
    }
}
