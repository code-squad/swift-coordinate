//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum RegexPattern: String {
    case verifyPattern = "\\([0-9]+,[0-9]+\\)"
}

enum InputError: Error {
    case invalidInput
    case invalidFormat
}

extension InputError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "입력 오류"
        case .invalidFormat:
            return "입력 형식 오류"
        }
    }
}

struct InputView {
    static func readInput() throws -> MyPoint {
        let coordinates: MyPoint
        
        let coordinatesText = try userInput()
        try verifyInputFormat(coordinatesText: coordinatesText)
        
        coordinates = try convertCoordinatesFormat(coordinatesText: coordinatesText)
        
        return coordinates
    }
    
    private static func userInput() throws -> String {
        print("좌표를 입력하세요.")
        
        guard let coordinatesText = readLine() else { throw InputError.invalidInput }
        
        return coordinatesText
    }
    
    private static func verifyInputFormat(coordinatesText: String) throws {
        if coordinatesText.range(of: RegexPattern.verifyPattern.rawValue, options: [.regularExpression]) == nil {
            throw InputError.invalidFormat
        }
    }
    
    private static func convertCoordinatesFormat(coordinatesText: String) throws -> MyPoint {
        let numbersText = coordinatesText.components(separatedBy: ["(", ")"]).joined().split(separator: ",")
        var numbers: [Int] = []
        
        for numberText in numbersText {
            numbers.append(try convertStringToInt(numberText: String(numberText)))
        }
        
        return try MyPoint(x: numbers[0], y: numbers[1])
    }
    
    private static func convertStringToInt(numberText: String) throws -> Int {
        guard let number = Int(numberText) else {
            throw InputError.invalidInput
        }
        
        return number
    }
}
