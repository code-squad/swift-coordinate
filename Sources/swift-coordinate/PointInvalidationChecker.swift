//
//  InvalidationChecker.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct PointInvalidationChecker {
    
    let customCharacterSet : CharacterSet = CharacterSet.init(charactersIn: "()-,")
    
    func checkInputValidation(formula: String) throws -> Array<String.SubSequence> {
        let point = formula.trimmingCharacters(in: customCharacterSet).split(separator: ",")
        guard point.count == 2 else {
            throw CustomErrors.InputError.wrongPoint
        }
        if Int(point[0]) == nil || Int(point[1]) == nil {
            throw CustomErrors.InputError.wrongPoint
        }
        if Int(point[0])! <= 0 || Int(point[0])! > 24  || Int(point[1])! <= 0 || Int(point[1])! > 24 {
            throw CustomErrors.InputError.invalidRange
        }
        return point
    }
    
    func checkAvailableCharacterSet(formula: String) throws {
        if formula.trimmingCharacters(in: getAvailableCharacterSet()).count != 0 {
            throw CustomErrors.InputError.invalidCharacter
        }
    }
    func getAvailableCharacterSet() -> CharacterSet {
        var availableCharacterSet : CharacterSet = customCharacterSet
        availableCharacterSet.formUnion(CharacterSet.decimalDigits)
        return availableCharacterSet
    }
    
    func checkPointInvalidation(points: Points) throws {
        try checkSamePoint(points: points)
        if points.count == 4 {
            try checkRectShape(points: points)
        }
    }
    
    func checkSamePoint(points: Points) throws {
        for i in 0..<points.count {
            try comparePoint(points: points, pointIndex: i)
        }
    }
    private func comparePoint(points: Points, pointIndex: Int) throws {
        for j in (pointIndex+1)..<points.count {
            if points[pointIndex].x == points[j].x && points[pointIndex].y == points[j].y {
                throw CustomErrors.InputError.samePoint
            }
        }
    }
    
    func checkRectShape(points: Points) throws {
        try countRectX(points: points)
        try countRectY(points: points)
    }
    func countRectX(points: Points) throws {
        var xCounter : [Int:Int] = [:]
        for point in points {
            if xCounter[point.x] == nil {
                xCounter[point.x] = 1
                continue
            }
            xCounter[point.x]! += 1
        }
        try checkCounter(counter: xCounter)
    }
    func countRectY(points: Points) throws {
        var yCounter : [Int:Int] = [:]
        for point in points {
            if yCounter[point.y] == nil {
                yCounter[point.y] = 1
                continue
            }
            yCounter[point.y]! += 1
        }
        try checkCounter(counter: yCounter)
    }
    private func checkCounter(counter: [Int:Int]) throws {
        for value in counter.values {
            if value != 2 {
                throw CustomErrors.InputError.invalidRect
            }
        }
    }
    
}
