//
//  InputValueCheck.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 8. 25..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputValueCheck {
    func makeCheckedValues (_ inputCoordinates: String) throws -> MyPoint {
        if !inputCoordinates.isEmpty {
        guard let removeParenthesisElements = parenthesisRemoval(inputCoordinates) else { throw ErrorMessage.Message.notBracketValue}
        guard let splitCommaElements = splitCommaElemetns(removeParenthesisElements) else { throw ErrorMessage.Message.notSeparatedCommaValue}
        guard let convertElements = makeValidCoordinates(splitCommaElements) else { throw ErrorMessage.Message.notIntValue}
        guard let validCoordinatesValue = createInRangeCoordinates(convertElements) else { throw ErrorMessage.Message.overCoordinateValue}
       
        return validCoordinatesValue
        }
        else { throw ErrorMessage.Message.emptyInputValue }
    }
    
    private func parenthesisRemoval(_ inputCoordinates: String) -> String? {
        let removeParenthesisElements = inputCoordinates
        if removeParenthesisElements.contains("(") && removeParenthesisElements.contains(")") {
            let resultRemoveParenthesisElements = removeParenthesisElements.trimmingCharacters(in: ["(", ")"])
            return resultRemoveParenthesisElements
        }
        else {
            return nil
        }
    }
    
    private func splitCommaElemetns(_ removeParenthesisCoordinates: String) -> Array<String>? {
        var separateElements: Array<String> = []
        guard removeParenthesisCoordinates.contains(",") else { return nil }
        separateElements = removeParenthesisCoordinates.split(separator: ",").map(String.init)
        return separateElements
    }
    
    private func makeValidCoordinates(_ separatedCoordinates: Array<String>) -> Array<Int>? {
        let convertCoordinates = separatedCoordinates.compactMap{ tempValue in Int(tempValue) }
        if convertCoordinates.count != separatedCoordinates.count {
            return nil
        }
        return convertCoordinates
    }
    
    private func createInRangeCoordinates(_ input: Array<Int>) -> MyPoint? {
        for index in 0 ..< input.count {
            guard input[index] <= 24 else { return nil }
        }
        return MyPoint(x: input[0], y: input[1])
    }
}
