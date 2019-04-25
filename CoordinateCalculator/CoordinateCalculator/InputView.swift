//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static public func readInput() throws -> String {
        let question = "좌표를 입력하세요. "
        print(question)
        guard let input = readLine(), CoordinateValidator.isValidInputFormat(input) else {
            throw CoordinateError.invalidInputFormat
        }
        return input
    }
}

struct Parser {
    static public func parse(using input: String) throws -> [String] {
        let blankRemovedInput = removeBlank(in: input)
        let pairs = divideIntoPairs(from: blankRemovedInput)
        guard let pairsWithoutParenthesis = unwrapParenthesis(of: pairs) else {
            throw CoordinateError.impossibleToParse
        }
        guard let tokens = divideByComma(from: pairsWithoutParenthesis) else {
            throw CoordinateError.impossibleToParse
        }
        return tokens
    }
    
    static private func removeBlank(in input: String) -> String {
        return input.replacingOccurrences(of: " ", with: "")
    }
    
    static private func divideIntoPairs(from input: String) -> [String] {
        return input.components(separatedBy: "-")
    }
    
    static private func unwrapParenthesis(of pairs: [String]) -> [String]? {
        var pairsWithoutParenthesis = [String]()
        for pair in pairs {
            guard let openParenthesisIndex = pair.index(of: "(") else { return nil }
            guard let closeParenthesisIndex = pair.index(of: ")") else { return nil }
            let startIndexOfNum = pair.index(openParenthesisIndex, offsetBy: 1)
            let endIndexOfNum = pair.index(closeParenthesisIndex, offsetBy: -1)
            let unwrappedPair = pair[startIndexOfNum...endIndexOfNum]
            pairsWithoutParenthesis.append(String(unwrappedPair))
        }
        return pairsWithoutParenthesis
    }
    
    static private func divideByComma(from pairs: [String]) -> [String]? {
        var tokens = [String]()
        for pair in pairs {
            let dividedByComma = pair.components(separatedBy: ",")
            if dividedByComma.count != 2 { return nil }
            tokens.append(contentsOf: dividedByComma)
        }
        return tokens
    }
    
}

struct Converter {
    static public func convert(_ tokens: [String]) throws -> [Int] {
        var numbers = [Int]()
        for element in tokens {
            guard let convertedNum = Int(element) else { throw CoordinateError.impossibleToConvert }
            numbers.append(convertedNum)
        }
        return numbers
    }
}
