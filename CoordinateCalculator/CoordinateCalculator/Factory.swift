//
//  Factory.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 22/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Factory {
    
    static func makePoint (pointArray: [Int]) throws -> MyPoint {
        guard pointArray.count == 2 else {
            throw Error.wrongFormat
        }
        return MyPoint(x: pointArray[0], y: pointArray[1])
    }
    
    static func makeLine (pointA: MyPoint, pointB: MyPoint) throws -> MyLine {
        guard (pointA.x == pointB.x) && (pointA.y == pointB.y) else {
            return MyLine(pointA: pointA, pointB: pointB)
        }  
        throw Error.wrongValue
    }
    
    static func makeTriangle (points:[MyPoint]) -> MyTriangle {
        return MyTriangle(lineAB: MyLine(pointA: points[0], pointB: points[1]), lineBC:  MyLine(pointA: points[1], pointB: points[2]),lineAC: MyLine(pointA: points[0], pointB: points[2]))
    }
}

