//
//  Checking.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Checking {
    enum ErrorMessage: String, Error {
        case ofInValidInputedValue = "(x,y)형태로 입력해야 합니다."
        case ofNonexistenceComma = "x와 y의 값은 콤마로 구분되어야 합니다."
        case ofExceedValidInput = "x,y 각각 최대 입력가능한 값은 24입니다."
        case ofValueIsNotInt = "입력된 좌표가 숫자가 아닙니다."
        case ofUnKnownError = "알려지지 않은 에러입니다. 관리자에게 문의하세요."
    }
    
    func returnCheckedValues (_ input: String) throws -> MyPoint {
        guard let temp = elimateParenthesis(input) else { throw ErrorMessage.ofInValidInputedValue }
        guard let validValues = checkCommaInInputs(temp) else { throw ErrorMessage.ofNonexistenceComma }
        guard let valueOfInt = converToInt(validValues) else { throw ErrorMessage.ofValueIsNotInt}
        guard let validValuesHasComma = checkisNotExceed(valueOfInt) else { throw ErrorMessage.ofExceedValidInput}
        let values = MyPoint(x: validValuesHasComma[0], y: validValuesHasComma[1])
        return values
    }
    
    // 좌우 괄호 제거 : nil이면 입력값이 없다는거고 ofEmptedInput 출력
    private func elimateParenthesis (_ input: String) -> String? {
        var input = input
        if input.contains("(") && input.contains(")") {
            input = input.trimmingCharacters(in: ["(", ")"])
            return input
        } else {
            return nil
        }
    }
    
    // 좌우 괄호제거후 콤마가 있는지 체크라도 콤마가 있다면 콤마기준으로 배열로 나눠서 저장
    private func checkCommaInInputs (_ input: String) -> Array<String>? {
        var temp = Array<String>()
        guard input.contains(",") else { return nil }
        temp = input.split(separator: ",").map(String.init)
        return temp
    }
    
    // 인트로 바꾸기
    private func converToInt (_ input: Array<String>) -> Array<Int>? {
        let temp = input.flatMap{ tempValue in Int(tempValue) }
        if temp.count != input.count {
            return nil
        }
        return temp
    }
    
    // 24를 초과했는지 체크
    private func checkisNotExceed (_ input: Array<Int>) -> Array<Int>? {
        for index in 0 ..< input.count {
            guard input[index] <= 24 else { return nil }
        }
        return input
    }
}

