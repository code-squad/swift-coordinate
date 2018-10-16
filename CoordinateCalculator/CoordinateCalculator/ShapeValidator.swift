//
//  ShapeValidator.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 16/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

public enum ShapeValidation: String {
    case notSatisfyTriangleInequality = "삼각형이 성립되지않는 좌표입니다."
    case notSatisfyRectangle = "직사각형이 성립되지않는 좌표입니다."
    case notSatisfyRectangleSupported = "지원하지 않는 직사각형입니다. x축과 y축에 모두 평행한 직사각형만 지원합니다."
    case outOfRangeMyPoint = "최대 4개의 좌표까지 입력 가능합니다."
}

struct ShapeValidator {
    private static func calculateDistance(between pointA: MyPoint, and pointB: MyPoint) -> Double {
        return sqrt(pow(Double(pointA.x-pointB.x), 2) + pow(Double(pointA.y-pointB.y), 2))
    }
    
    static func satisfyTriangleInequality(of points: [MyPoint]) -> Bool {
        var sideLengths = [Double]()
        sideLengths.append(calculateDistance(between: points[0], and: points[1]))
        sideLengths.append(calculateDistance(between: points[1], and: points[2]))
        sideLengths.append(calculateDistance(between: points[0], and: points[2]))
        sideLengths.sort()
        return sideLengths[0] + sideLengths[1] > sideLengths[2]
    }
    
    private static func makeRectangleLengthSet(by points: [MyPoint]) -> Set<Double> {
        var lengthSet = Set<Double>()
        lengthSet.insert(calculateDistance(between: points[0], and: points[1]))
        lengthSet.insert(calculateDistance(between: points[0], and: points[2]))
        lengthSet.insert(calculateDistance(between: points[0], and: points[3]))
        lengthSet.insert(calculateDistance(between: points[1], and: points[2]))
        lengthSet.insert(calculateDistance(between: points[1], and: points[3]))
        lengthSet.insert(calculateDistance(between: points[2], and: points[3]))
        return lengthSet
    }
    
    static func satisfyRectangle(of points: [MyPoint]) -> Bool {
        let lengthSet = makeRectangleLengthSet(by: points)
        return (lengthSet.count == 2 || lengthSet.count == 3)
    }
    
    static func satisfyRectangleSupported(of points: [MyPoint]) -> Bool {
        var xSet = Set<Int>(), ySet = Set<Int>()
        for point in points {
            xSet.insert(point.x)
            ySet.insert(point.y)
        }
        return ((xSet.count == 1 || xSet.count == 2 ) && (ySet.count == 1 || ySet.count == 2))
    }
    
}
