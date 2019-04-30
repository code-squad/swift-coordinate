//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Pair = (x: Int, y: Int)

struct InputView {
    static private let question = "좌표를 입력하세요. "
    static public func readInput() throws -> String {
        print(question)
        guard let input = readLine(), CoordinateValidator.isValidInputFormat(input) else {
            throw InputFormatError.invalidFormat
        }
        return input
    }
}

struct Parser {
    static public func parse(using input: String) throws -> [(String, String)] {
        let blankRemovedInput = removeBlank(in: input)
        let pairs = divideIntoPairs(from: blankRemovedInput)
        guard let pairsWithoutParenthesis = unwrapParenthesis(of: pairs) else {
            throw InputFormatError.invalidParenthesis
        }
        guard let pairsWithoutComma = divideByComma(from: pairsWithoutParenthesis) else {
            throw InputFormatError.impossibleTodivideByComma
        }
        return pairsWithoutComma
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
    
    static private func divideByComma(from pairs: [String]) -> [(String, String)]? {
        var dividedPairs: [(String, String)] = []
        for pair in pairs {
            let dividedByComma = pair.components(separatedBy: ",")
            if dividedByComma.count != 2 { return nil }
            dividedPairs.append((dividedByComma[0], dividedByComma[1]))
        }
        return dividedPairs
    }
    
}

struct Converter {
    static public func convert(_ pairs: [(x:String, y:String)]) throws -> [Pair] {
        var convertedPairs = [Pair]()
        for pair in pairs {
            guard let convertedX = Int(pair.x), let convertedY = Int(pair.y) else {
                throw ConverterError.impossibleToConvert
            }
            
            convertedPairs.append((convertedX, convertedY))
        }
        return convertedPairs
    }
}
