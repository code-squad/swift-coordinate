//
//  CoordinateConverter.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 9..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Shape {
    var area: Double? { get }
}

struct CoordinateConverter {
    private let validator: Validator
    
    init(validator: Validator) {
        self.validator = validator
    }
    
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
    
    private func checkRange(_ number: Int) throws {
        guard (0...24).contains(number) else {
            throw CoordinateConverter.Error.invalidRange
        }
    }
    
    private func parseNumbers(_ input: String) throws -> [Int] {
        let regex = "-?[0-9]+"
        let numbers = input.matches(for: regex)
        return numbers.compactMap { Int($0) }
    }
    
    func makePoint(from coordinate: String) throws -> MyPoint {
        guard validator.isValid(coordinate) else {
            throw CoordinateConverter.Error.invalidFormat
        }
        let numbers = try parseNumbers(coordinate)
        for number in numbers {
            try checkRange(number)
        }
        return MyPoint(x: numbers[0], y: numbers[1])
    }
    
    func makeLine(from coordinates: [String]) throws -> MyLine {
        let points = try coordinates.map { try makePoint(from: $0) }
        return MyLine(pointA: points[0], pointB: points[1])
    }
    
    func makeShape(from coordinates: [String]) throws -> Shape {
        
        switch coordinates.count {
        case 1:
            return try makePoint(from: coordinates[0])
        case 2:
            return try makeLine(from: coordinates)
        default:
            throw CoordinateConverter.Error.invalidFormat
        }
    }
}
