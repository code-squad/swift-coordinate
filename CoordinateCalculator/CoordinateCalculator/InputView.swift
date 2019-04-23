//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    public func readInput() -> MyPoint {
        let question = "좌표를 입력하세요."
        print(question)
        guard let line = readLine() else {
            return MyPoint()
        }
        return parseIntoPoint(using: line)
    }
    
    private func parseIntoPoint(using input: String) -> MyPoint {
        let trimmedInput = input.replacingOccurrences(of: " ", with: "")
        guard let inputWithoutParenthesis = unwrapParenthesis(of: trimmedInput) else {
            return MyPoint()
        }
        guard let (inputX, inputY) = divideNumbers(from: inputWithoutParenthesis) else {
            return MyPoint()
        }
        return MyPoint(x: inputX, y: inputY)
    }
    
    private func unwrapParenthesis(of input: String) -> String? {
        let startIndex = input.startIndex
        let lastIndex = input.index(before: input.endIndex)
        if input[startIndex] != "(" || input[lastIndex] != ")" {
            return nil
        }
        let frontIndex = input.index(startIndex, offsetBy: 1)
        let backIndex = input.index(input.endIndex, offsetBy: -2)
        return String(input[frontIndex...backIndex])
    }
    
    private func divideNumbers(from input: String) -> (Int, Int)? {
        let dividedByComma = input.components(separatedBy: ",")
        if dividedByComma.count != 2 {
            return nil
        }
        guard let x = Int(dividedByComma[0]), let y = Int(dividedByComma[1]) else {
            return nil
        }
        return (x, y)
    }
}
