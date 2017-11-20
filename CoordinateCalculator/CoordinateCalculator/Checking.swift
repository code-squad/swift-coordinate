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
        case ofInValidInputedValue = "좌표를 입력해주세요."
        case ofNonexistenceComma = "올바른 형태로 입력해주세요."
        case ofExceedValidInput = "최대 입력가능한 값은 24입니다."
        case ofUnKnownError = "알려지지 않은 에러입니다. 관리자에게 문의하세요."
    }
    
    func returnCheckedValues (_ input: String?) throws -> MyPoint {
        guard let temp = elimateParenthesis(input) else { throw ErrorMessage.ofInValidInputedValue }
        guard let validValues = checkCommaInInputs(temp) else { throw ErrorMessage.ofNonexistenceComma }
        guard let validValuesHasComma = checkisNotExceed(validValues) else { throw ErrorMessage.ofExceedValidInput}
        let values = MyPoint(x: Int(validValuesHasComma[0]) ?? 0, y: Int(validValuesHasComma[1]) ?? 0)
        return values
    }
    
    // 좌우 괄호 제거 : nil이면 입력값이 없다는거고 ofEmptedInput 출력
    private func elimateParenthesis (_ input: String?) -> String? {
        if var input = input {
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
    
    // 24를 초과했는지 체크
    private func checkisNotExceed (_ input: Array<String>) -> Array<String>? {
        for index in 0 ..< input.count {
            guard Int(input[index]) ?? 25 <= 24 else { return nil }
        }
        return input
    }
}

