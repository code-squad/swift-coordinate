//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    
    static func makePoint (pointArray: [Int]) -> MyPoint {
        return MyPoint(x: pointArray[0], y: pointArray[1])
    }
    
    static func makeLine (pointArray: [MyPoint]) -> MyLine {
        return MyLine(pointA: pointArray[0], pointB: pointArray[1])
    }
    
    
    static func validateFormat(input: String) throws -> [Int] {
        var input = input
        if try Validator.validateFormatChecker(input: input) {
            input.removeFirst()
            input.removeLast()
            let points = input.split(separator: ",").map {String($0)}
            let convertPointstoInt = try points.map { (point: String) -> Int in
                guard let point = Int(point) else {
                    throw Error.notIntValue
                }
                return point
            }
            return convertPointstoInt
        }
        throw Error.wrongFormat
    }
    
    
    
    
    
}
    

