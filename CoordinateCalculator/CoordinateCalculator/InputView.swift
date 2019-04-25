//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static public func readInput() -> (Int, Int)? {
        let question = "좌표를 입력하세요. "
        print(question)
        guard let input = readLine(), CoordinateValidator.isValidInputFormat(input) else {
            return nil
        }
        return Parser.parseIntoNumbers(using: input)
    }
}

struct Parser {
    static public func parseIntoNumbers(using input: String) -> (Int, Int)? {
        let blankRemovedInput = input.replacingOccurrences(of: " ", with: "")
        guard let inputWithoutParenthesis = unwrapParenthesis(of: blankRemovedInput) else {
            return nil
        }
        guard let (numX, numY) = divideNumbers(from: inputWithoutParenthesis) else {
            return nil
        }
        return (numX, numY)
    }
    
    static private func unwrapParenthesis(of input: String) -> String? {
        guard let openParenthesisIndex = input.index(of: "(") else { return nil }
        guard let closeParenthesisIndex = input.index(of: ")") else { return nil }
        let startIndexOfNum = input.index(openParenthesisIndex, offsetBy: 1)
        let endIndexOfNum = input.index(closeParenthesisIndex, offsetBy: -1)
        return String(input[startIndexOfNum...endIndexOfNum])
    }
    
    static private func divideNumbers(from input: String) -> (Int, Int)? {
        let dividedByComma = input.components(separatedBy: ",")
        if dividedByComma.count != 2 {
            return nil
        }
        guard let convertedX = Int(dividedByComma[0]) else { return nil }
        guard let convertedY = Int(dividedByComma[1]) else { return nil }
        return (convertedX, convertedY)
    }
}
