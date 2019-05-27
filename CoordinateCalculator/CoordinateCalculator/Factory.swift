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
            return MyLine(pointA: pointA, pointB: pointB)
        }
        throw Error.duplicateValue
    }
    
    static func makeTriangle (pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) -> MyTriangle {
        return MyTriangle(pointA: pointA, pointB: pointB, pointC: pointC)
    }
    
    static func isRectangle(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint, pointD: MyPoint) -> Bool {
        let points = [pointA, pointB, pointC, pointD]
        var pointXSet = Set<Int>()
        var pointYSet = Set<Int>()
        for point in points {
            pointXSet.insert(point.x)
            pointYSet.insert(point.y)
        }
        return pointXSet.count == 2 && pointYSet.count == 2
    }
    
    static func makeRectangle(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint, pointD: MyPoint) throws -> MyRect {
        let origin = min(pointA, pointB, pointC, pointD)
        let rightTop = max(pointA, pointB, pointC, pointD)
        let size = CGSize(width: rightTop.x - origin.x, height: rightTop.y - origin.y)
        let rect = MyRect(origin: origin, size: size)
        guard isRectangle(pointA: pointA, pointB: pointB, pointC: pointC, pointD: pointD) else {
            throw Error.failedCreateRect
        }
        return rect
    }
}

