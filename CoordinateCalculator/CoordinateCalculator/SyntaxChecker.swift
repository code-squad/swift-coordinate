//
//  SyntaxChecker.swift
//  CoordinateCalculator
//
//  Created by 1100200 on 2018. 7. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//


import Foundation

struct SyntaxChecker {
    enum ErrorMessage: String, Error {
        case ofInValidInputedValue = "(x,y)형태로 입력해야 합니다."
        case ofNonexistenceComma = "x와 y의 값은 콤마로 구분되어야 합니다."
        case ofExceedValidInput = "x,y 각각 최대 입력가능한 값은 24입니다."
        case ofValueIsNotInt = "입력된 좌표가 숫자가 아닙니다."
        case ofUnKnownError = "알려지지 않은 에러입니다. 관리자에게 문의하세요."
    }
    
    func makeCheckedValues (_ input: String) throws -> MyPoint {
        guard let temp = eliminateParenthesis(input) else { throw ErrorMessage.ofInValidInputedValue }
        guard let validValues = splitInputValueByComma(temp) else { throw ErrorMessage.ofNonexistenceComma }
        guard let valueOfInt = converToInt(validValues) else { throw ErrorMessage.ofValueIsNotInt}
        guard isLessThanLimit(valueOfInt) else { throw ErrorMessage.ofExceedValidInput}
        let myPoint = MyPoint(x: valueOfInt[0], y: valueOfInt[1])
        return myPoint
    }
    
    // 입력형태가 잘못됐다면 nil반환
    private func eliminateParenthesis (_ input: String) -> String? {
        var input = input
        if input.contains("(") && input.contains(")") {
            input = input.trimmingCharacters(in: ["(", ")"])
            return input
        } else {
            return nil
        }
    }
    
    // 콤마가 있는지 체크하고 콤마가 있다면 콤마기준으로 배열로 나눠서 저장, 없다면 nil반환
    private func splitInputValueByComma (_ input: String) -> Array<String>? {
        var temp = Array<String>()
        guard input.contains(",") else { return nil }
        temp = input.split(separator: ",").map(String.init)
        return temp
    }
    
    // flatmap 사용해서 인트로변환이 안되면 배열의 길이가 달라지게 해서, 길이가 같지 않다면 nil 반환
    private func converToInt (_ input: Array<String>) -> Array<Int>? {
        let temp = input.flatMap{ tempValue in Int(tempValue) }
        if temp.count != input.count {
            return nil
        }
        return temp
    }
    
    // 24를 초과했는지 체크
    private func isLessThanLimit (_ input: Array<Int>) -> Bool {
        for index in 0 ..< input.count {
            guard input[index] <= 24 else { return false }
        }
        return true
    }
}
