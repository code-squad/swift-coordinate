//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum Question: String {
    case inputCoordinates = "좌표를 입력하세요."
}

enum RegexPattern: String {
    case verifyPattern = "^\\([0-9]+,[0-9]+\\)$"
}

extension String {
    func verifyInputFormat(regexPattern: String) -> String {
        if let coordinateRange = self.range(of: regexPattern, options: [.regularExpression]) {
            return String(self[coordinateRange])
        }
        
        return ""
    }
}

struct InputView {
    static func readInput() throws -> [String] {
        var coordinates: [String] = []
        
        print(Question.inputCoordinates.rawValue)
        
        guard let input = readLine() else { throw InputError.invalidInput }
        
        for coordinate in input.split(separator: "-") {
            let verificationResult = try verifyCoordinate(String(coordinate))
            
            coordinates.append(verificationResult)
        }
        
        return coordinates
    }
    
    private static func verifyCoordinate(_ coordinate: String) throws -> String {
        let verificationResult = coordinate.verifyInputFormat(regexPattern: RegexPattern.verifyPattern.rawValue)
        
        if verificationResult == "" {
            throw InputError.invalidFormat
        }
        
        return verificationResult
    }
}
