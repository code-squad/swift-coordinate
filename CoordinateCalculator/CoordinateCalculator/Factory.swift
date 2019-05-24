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
            return MyLine(pointA, pointB)
        }
        throw Error.duplicateValue
    }
    
    static func makeTriangle (pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) -> MyTriangle {
        return MyTriangle(pointA, pointB, pointC)
    }
    
    static func makeRectangle(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint, pointD: MyPoint) -> MyRect{
        return MyRect(pointA, pointB, pointC, pointD)
    }
}

