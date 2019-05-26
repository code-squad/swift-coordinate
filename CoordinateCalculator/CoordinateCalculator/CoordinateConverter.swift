//
//  Process.swift
//  CoordinateCalculator
//
//  Created by JH on 10/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum UserInputError: Error, CustomStringConvertible {
    case noInputValue
    case cannotFindParentheses
    case notNumber
    case incorrectInputValueCount
    case rangeOver
    case unknown
    
    var description: String {
        switch self {
        case .noInputValue:
            return "입력값이 없습니다. 값을 입력해주세요."
        case .cannotFindParentheses:
            return "입력형식이 잘못됐습니다. 괄호안에 좌표를 입력해주세요."
        case .notNumber:
            return "숫자를 입력해주세요."
        case .incorrectInputValueCount:
            return "(x,y) 두값을 입력해주세요."
        case .rangeOver:
            return "입력범위를 초과했습니다. 0~24 범위안에서 입력해주세요."
        case .unknown:
            return "알수없는 오류입니다"
        }
    }
}

struct CoordinateConverter {
    
    static func makeCoordinateValues(from input: String) throws -> [(x: Int, y: Int)] {
        let splittedCoordinates = splitCoordinates(input: input)
        var result: [(x:Int, y: Int)] = []
        
        for splittedCoordinate in splittedCoordinates {
            let coordinateValue = try makeCoordinate(from: splittedCoordinate)
            guard checkRange(coordinateValue: coordinateValue) else {
                throw UserInputError.rangeOver
            }
            result.append(coordinateValue)
        }
        
        return result
    }
    
    private static func splitCoordinates(input: String) -> [String] {
        return input.split(separator: "-", omittingEmptySubsequences: false)
            .map { String($0) }
    }
    
    
    
    private static func makeCoordinate(from input: String) throws -> (x: Int, y: Int) {
        guard input.first == "(" , input.last == ")" else {
            throw UserInputError.cannotFindParentheses
        }
        var input = input
        input.removeFirst()
        input.removeLast()
        
        let splittedValues = input.split(separator: ",", maxSplits: 2, omittingEmptySubsequences: false).map { String($0) }
        guard splittedValues.count == 2 else {
            throw UserInputError.incorrectInputValueCount
        }
        
        let intValues = try splittedValues.map { (value: String) -> Int in
            guard let intValue = Int(value) else {
                throw UserInputError.notNumber
            }
            return intValue
        }
        return (x: intValues[0], y: intValues[1])
    }
    
    private static func checkRange(coordinateValue: (x: Int, y: Int)) -> Bool {
        
        if coordinateValue.x <= 24 && coordinateValue.y <= 24 && coordinateValue.x >= 0 && coordinateValue.y >= 0 {
            return true
        }
        
        return false
    }
}


