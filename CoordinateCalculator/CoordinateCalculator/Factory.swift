//
//  Factory.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 22/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Factory {
    static func makePoint (points: [Int]) throws -> MyPoint {
        guard points.count == 2 else {
            throw Error.wrongFormat
        }
        return MyPoint(x: points[0], y: points[1])
    }
    
    static func makeLine (pointA: MyPoint, pointB: MyPoint) throws -> MyLine {
        guard (pointA.x == pointB.x) && (pointA.y == pointB.y) else {
            return MyLine(pointA, pointB)
        }
        throw Error.duplicateValue
    }
    
    static func makeTriangle (pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) -> MyTriangle {
        return MyTriangle(pointA, pointB, pointC)
    }
    
    static func makeRectangle(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint, pointD: MyPoint) throws -> MyRect{
        guard (pointA.x < pointB.x) && (pointA.y == pointB.y)||(pointB.y < pointD.y) && (pointB.x == pointD.x) || (pointB.x == pointC.x) && (pointD.y == pointC.y) else {
             throw Error.failedCreateRect
        }
       return MyRect(pointA, pointB, pointC, pointD)
    }
}

