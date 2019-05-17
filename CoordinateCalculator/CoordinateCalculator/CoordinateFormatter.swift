//
//  CoordinateFormatter.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 9..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Shape {
    var area: Double? { get }
}

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
    
    static private func checkRange(_ number: Int) throws {
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
        guard validator.isValid(input) else {
            throw CoordinateFormatter.Error.invalidFormat
        }
        let numbers = try parseNumbers(input)
        for number in numbers {
            try checkRange(number)
        }
        return MyPoint(x: numbers[0], y: numbers[1])
    }
    
    static func makeLine(from coordinates: [String], validator: Validator) throws -> MyLine {
        let points = try coordinates.map { try CoordinateFormatter.makePoint(from: $0, validator: validator) }
        return MyLine(pointA: points[0], pointB: points[1])
    }
    
    static func makeShape(from coordinates: [String], validator: Validator) throws -> Shape {
        
        switch coordinates.count {
        case 1:
            return try makePoint(from: coordinates[0], validator: validator)
        case 2:
            return try makeLine(from: coordinates, validator: validator)
        default:
            throw CoordinateFormatter.Error.invalidFormat
        }
    }
}
