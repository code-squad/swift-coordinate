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

enum RegexPattern: String {
    case verifyPattern = "\\([0-9]+,[0-9]+\\)"
}

extension String {
    func verifyInputFormat(regexPattern: String) throws {
        if self.range(of: regexPattern, options: [.regularExpression]) == nil {
            throw InputError.invalidFormat
        }
    }
}

struct InputView {
    static func readInput() throws -> String {
        print("좌표를 입력하세요.")
        
        guard let coordinatesText = readLine() else { throw InputError.invalidInput }
        try coordinatesText.verifyInputFormat(regexPattern: RegexPattern.verifyPattern.rawValue)
        
        return coordinatesText
    }
}
