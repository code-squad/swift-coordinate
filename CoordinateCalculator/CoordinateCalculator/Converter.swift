//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    static func converts(inputs: [String] ) throws -> [[Int]]{
        let coordintes = try inputs.map {
            try Converter.convert(input: $0)
        }
        return coordintes
    }
    
    private static func convert(input: String) throws -> [Int] {
        var input = input
        guard Validator.validateFormatChecker(input: input) else {
            throw Error.wrongFormat
        }
        input.removeFirst()
        input.removeLast()
        let points = input.split(separator: ",").map{ String($0) }
        let convertPointstoInt = try points.map { try checkPointToInt(point: $0) }
        for point in convertPointstoInt {
            try Validator.validateRange(number: point)
        }
        return convertPointstoInt
    }
    
    private static func checkPointToInt(point: String) throws -> Int {
        guard let point = Int(point) else {
            throw Error.notIntValue
        }
        return point
    }
}


