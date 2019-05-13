//
//  CoordinateFormatter.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 9..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateFormatter {
    
    enum Error: Swift.Error {
        case invalidFormat
        case invalidRange
        
        var localizedDescription: String {
            switch self {
            case .invalidFormat:
                return "유효하지 않은 형식입니다."
            case .invalidRange:
                return "유효하지 않은 범위의 숫자입니다."
            }
        }
    }
    
    static private func validateRange(_ number: Int) throws {
        guard (0...24).contains(number) else {
            throw CoordinateFormatter.Error.invalidRange
        }
    }
    
    static private func parseNumbers(_ input: String) throws -> [Int] {
        let regex = "-?[0-9]+"
        let numbers = input.matches(for: regex)
        return numbers.compactMap { Int($0) }
    }
    
    static func makePoint(from input: String, validator: Validator) throws -> MyPoint {
        guard validator.isValidFormat(input) else {
            throw CoordinateFormatter.Error.invalidFormat
        }
        let numbers = try parseNumbers(input)
        for number in numbers {
            try validateRange(number)
        }
        return MyPoint(x: numbers[0], y: numbers[1])
    }
}
