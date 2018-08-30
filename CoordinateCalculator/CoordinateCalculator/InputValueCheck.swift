//
//  InputValueCheck.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 8. 25..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
/*
 @Check 0 : 값이 없으면 에러메시지 출력 후 다시 입력 받음
 좌표 정보는 괄호"(", ")"로 둘러쌓여 있으며 쉼표(,)로 x값과 y값을 구분한다.
 @Check 1 : ()로 둘러 쌓여 있는 값인지 먼저 확인 / ()로 둘러 쌓여 있지 않으면 에러 메시지 이후 다시 입력 받음
 @Check 2 : 쉼표(,)로 x, y값 구분 / , 가 없으면 에러 메시지 이후 다시 입력 받음
 X, Y좌표 모두 최대 24까지만 입력할 수 있다.
 @Check 3 : x,y의 값 24 넘는지 체크 입력 범위를 초과할 경우 에러 문구를 출력하고 다시 입력을 받는다.
 */

import Foundation

struct InputValueCheck {
    func makeCheckedValues (_ input: String) throws -> MyPoint {
        if !input.isEmpty {
        guard let removeParenthesisElements = parenthesisRemoval(input) else { throw ErrorMessage.Message.notBracketValue}
        guard let splitCommaElements = splitCommaElemetns(removeParenthesisElements) else { throw ErrorMessage.Message.notSeparatedCommaValue}
        guard let convertToIntElements = makeValueToInt(splitCommaElements) else { throw ErrorMessage.Message.notIntValue}
        guard let validCoordinatesValue = checkOverRangeValue(convertToIntElements) else { throw ErrorMessage.Message.overCoordinateValue}
       
        return validCoordinatesValue
        }
        else { throw ErrorMessage.Message.emptyInputValue }
    }
    
    private func parenthesisRemoval(_ input: String) -> String? {
        let removeParenthesisElements = input
        if removeParenthesisElements.contains("(") && removeParenthesisElements.contains(")") {
            let resultRemoveParenthesisElements = removeParenthesisElements.trimmingCharacters(in: ["(", ")"])
            return resultRemoveParenthesisElements
        }
        else {
            return nil
        }
    }
    
    private func splitCommaElemetns(_ input: String) -> Array<String>? {
        var separateElements: Array<String> = []
        guard input.contains(",") else { return nil }
        separateElements = input.split(separator: ",").map(String.init)
        return separateElements
    }
    
    private func makeValueToInt(_ input: Array<String>) -> Array<Int>? {
        let intCoordinateValue = input.compactMap{ tempValue in Int(tempValue) }
        if intCoordinateValue.count != input.count {
            return nil
        }
        return intCoordinateValue
    }
    
    private func checkOverRangeValue(_ input: Array<Int>) -> MyPoint? {
        for index in 0 ..< input.count {
            guard input[index] <= 24 else { return nil }
        }
        return MyPoint(x: input[0], y: input[1])
    }
}
