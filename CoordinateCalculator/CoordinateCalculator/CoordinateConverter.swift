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
        case exceedCoordinateCount
        
        var localizedDescription: String {
            switch self {
            case .invalidFormat:
                return "유효하지 않은 형식입니다."
            case .invalidRange:
                return "유효하지 않은 범위의 숫자입니다."
            case .exceedCoordinateCount:
                return "좌표 갯수를 초과하였습니다."
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
    
    private func makePoint(from coordinate: String) throws -> MyPoint {
        guard validator.isValid(coordinate) else {
            throw CoordinateConverter.Error.invalidFormat
        }
        let numbers = try parseNumbers(coordinate)
        for number in numbers {
            try checkRange(number)
        }
        return MyPoint(x: numbers[0], y: numbers[1])
    }
    
    private func makeLine(_ coordinateA: String, _ coordinateB: String) throws -> MyLine {
        let pointA = try makePoint(from: coordinateA)
        let pointB = try makePoint(from: coordinateB)
        return MyLine(pointA: pointA, pointB: pointB)
    }
    
    func makeShape(from coordinates: [String]) throws -> Shape {
        
        switch coordinates.count {
        case 1:
            return try makePoint(from: coordinates[0])
        case 2:
            return try makeLine(coordinates[0], coordinates[1])
        default:
            throw CoordinateConverter.Error.exceedCoordinateCount
        }
    }
}
