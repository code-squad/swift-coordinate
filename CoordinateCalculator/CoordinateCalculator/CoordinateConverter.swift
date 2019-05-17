//
//  CoordinateConverter.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 9..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Shape {
    func points() -> [MyPoint]
}

protocol Dimension {
    func area() -> Double
}

struct CoordinateConverter {
    private let parser: Parser
    private let validator: Validator
    
    init(parser: Parser, validator: Validator) {
        self.parser = parser
        self.validator = validator
    }
    
    enum Error: Swift.Error {
        case invalidFormat
        case invalidRange
        case exceedCoordinateCount
        case failedParsingCoordinates
        
        var localizedDescription: String {
            switch self {
            case .invalidFormat:
                return "유효하지 않은 형식입니다."
            case .invalidRange:
                return "유효하지 않은 범위의 숫자입니다."
            case .exceedCoordinateCount:
                return "좌표 갯수를 초과하였습니다."
            case .failedParsingCoordinates:
                return "좌표 파싱에 실패하였습니다."
            }
        }
    }
    
    private func makePoint(from coordinate: String) throws -> MyPoint {
        guard validator.isValid(coordinate) else {
            throw CoordinateConverter.Error.invalidFormat
        }
        let numbers = parser.parseNumbers(coordinate)
        guard numbers.count == 2 else {
            throw CoordinateConverter.Error.failedParsingCoordinates
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
