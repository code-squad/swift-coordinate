//
//  LiteralPointValidator.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol UserInputParsable {
    func parse(userInput: String) throws -> [(x: Int, y: Int)]
}

struct StringPointParser: UserInputParsable {
    
    func parse(userInput: String) throws -> [(x: Int, y: Int)]  {
        var points: [(x: Int, y: Int)] = []
        let strings = userInput.split(separator: "-")
        try strings.forEach {
            guard isValid(userInput: String($0)) else {
                throw UserInputError.inputParsingError
            }
            do {
                let result = try convert(string: String($0))
                points.append(result)
            }
            catch let error {
                // Cannot test, System Internal Error
                throw error
            }
        }
        return points
    }
    
    private func convert(string: String) throws -> (x: Int, y: Int) {
        let subStrings = string.trimmingCharacters(in: ["(",")"]).components(separatedBy: ",")
        guard subStrings.count == 2,
            let strX = subStrings.first,
            let strY = subStrings.last?.trimmingCharacters(in: .whitespacesAndNewlines),
            let x = Int(strX),
            let y = Int(strY) else {
                // Cannot test, System Internal Error
                throw UserInputError.internalError
        }
        return (x: x, y: y)
    }
    
    private func isValid(userInput: String) -> Bool {
        let regex = "\\(([0-1]{0,1}[0-9]|[2][0-4]),([0-1]{0,1}[0-9]|[2][0-4])\\)"
        guard let range = userInput.range(of: regex, options: .regularExpression, range: nil, locale: nil),
                    userInput.range(of: userInput) == range else {
            return false
        }
        return true
    }
}
