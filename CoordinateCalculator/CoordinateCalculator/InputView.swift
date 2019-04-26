//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputError: Error {
    case invalidInput
    case invalidFormat
}

extension InputError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "입력 오류"
        case .invalidFormat:
            return "입력 형식 오류"
        }
    }
}

enum Question: String {
    case inputCoordinates = "좌표를 입력하세요."
}

enum RegexPattern: String {
    case verifyPattern = "^\\([0-9]+,[0-9]+\\)$"
}

extension String {
    func verifyInputFormat(regexPattern: String) -> String {
        if let coordinatesRange = self.range(of: regexPattern, options: [.regularExpression]) {
            return String(self[coordinatesRange])
        }
        
        return ""
    }
}

struct InputView {
    static func readInput() throws -> [String] {
        var coordinatesTexts: [String] = []
        
        print(Question.inputCoordinates.rawValue)
        
        guard let input = readLine() else { throw InputError.invalidInput }
        
        for coordinatesText in input.split(separator: "-") {
            let verificationResult = try verifyCoordinates(coordinatesText: String(coordinatesText))
            
            coordinatesTexts.append(verificationResult)
        }
        
        return coordinatesTexts
    }
    
    private static func verifyCoordinates(coordinatesText: String) throws -> String {
        let verificationResult = coordinatesText.verifyInputFormat(regexPattern: RegexPattern.verifyPattern.rawValue)
        
        if verificationResult == "" {
            throw InputError.invalidFormat
        }
        
        return verificationResult
    }
}
