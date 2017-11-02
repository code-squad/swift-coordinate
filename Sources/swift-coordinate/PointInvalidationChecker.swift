//
//  InvalidationChecker.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct PointInvalidationChecker {
    
    func checkPointInvalidation(points: Points) throws {
        try checkSamePoint(points: points)
        if points.count == 4 {
            try checkRectShape(points: points)
        }
    }
    
    func checkSamePoint(points: Points) throws {
        for i in 0..<points.count {
            for j in (i+1)..<points.count {
                if points[i].x == points[j].x && points[i].y == points[j].y {
                    throw CustomErrors.InputError.samePoint
                }
            }
        }
    }
    
    func checkRectShape(points: Points) throws {
        try checkRectX(points: points)
        try checkRectY(points: points)
    }
    func checkRectX(points: Points) throws {
        var xChecker : [Int:Int] = [:]
        for point in points {
            if xChecker[point.x] == nil {
                xChecker[point.x] = 1
            } else {
                xChecker[point.x]! += 1
            }
        }
        for value in xChecker.values {
            if value != 2 {
                throw CustomErrors.InputError.invalidRect
            }
        }
    }
    func checkRectY(points: Points) throws {
        var yChecker : [Int:Int] = [:]
        for point in points {
            if yChecker[point.y] == nil {
                yChecker[point.y] = 1
            } else {
                yChecker[point.y]! += 1
            }
        }
        for value in yChecker.values {
            if value != 2 {
                throw CustomErrors.InputError.invalidRect
            }
        }
    }
}
