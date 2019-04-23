//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputError: Error {
    case whileReadingInput
    case invalidParenthesis
    case invalidNumber
}

struct InputView {
    static public func readInput() throws -> MyPoint {
        let question = "좌표를 입력하세요."
        print(question)
        guard let line = readLine() else {
            throw InputError.whileReadingInput
        }
        return try parseIntoPoint(using: line)
    }
    
    static private func parseIntoPoint(using input: String) throws -> MyPoint {
        let inputWithoutBlank = input.replacingOccurrences(of: " ", with: "")
        guard let inputWithoutParenthesis = unwrapParenthesis(of: inputWithoutBlank) else {
            throw InputError.invalidParenthesis
        }
        guard let (inputX, inputY) = divideNumbers(from: inputWithoutParenthesis) else {
            throw InputError.invalidNumber
        }
        return MyPoint(x: inputX, y: inputY)
    }
    
    static private func unwrapParenthesis(of input: String) -> String? {
        let frontParenthesisIndex = input.startIndex
        let backParenthesisIndex = input.index(before: input.endIndex)
        if input[frontParenthesisIndex] != "(" || input[backParenthesisIndex] != ")" {
            return nil
        }
        let startIndexOfNum = input.index(frontParenthesisIndex, offsetBy: 1)
        let endIndexOfNum = input.index(input.endIndex, offsetBy: -2)
        return String(input[startIndexOfNum...endIndexOfNum])
    }
    
    static private func divideNumbers(from input: String) -> (Int, Int)? {
        let dividedByComma = input.components(separatedBy: ",")
        if dividedByComma.count != 2 {
            return nil
        }
        guard let convertedX = Int(dividedByComma[0]), let convertedY = Int(dividedByComma[1]) else {
            return nil
        }
        return (convertedX, convertedY)
    }
}
