//
//  SyntaxChecker.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct SyntaxChecker {
    // 에러 메세지를 갖는 enum선언
    enum ErrorMessage: String, Error {
        case ofValueIsNotInt = "입력된 좌표가 숫자가 아닙니다."
        case ofNonexistentParenthesis = "(x,y)형태로 입력해야 합니다."
        case ofNonexistenceComma = "x와 y의 값은 콤마로 구분되어야 합니다."
        case ofExceedValidInput = "x,y 각각 최대 입력가능한 값은 24입니다."
        case ofUnKnownError = "알려지지 않은 에러입니다. 관리자에게 문의하세요."
    }
    
    // 값들을 체크하여 Int 배열로 반환
    func getErrorChekcedValue (_ input: String) throws -> Array<MyPoint> {
        var numericValues : [(Int, Int)] = []
        var points = [MyPoint]()
        let  stringCoords = splitByDash(input)
        for stringCoord in stringCoords {
            guard isSupportedValues(stringCoord) == true else { throw ErrorMessage.ofValueIsNotInt}
            guard let valueWithoutParenthesis = eliminateParenthesis(stringCoord) else { throw ErrorMessage.ofNonexistentParenthesis }
            guard let valueSplitedByComma = splitInputValueByComma(valueWithoutParenthesis) else { throw ErrorMessage.ofNonexistenceComma }
            guard let numericValue = convertToInt(valueSplitedByComma) else { throw ErrorMessage.ofExceedValidInput }
            numericValues.append(numericValue)
            points = makePointInstance(numericValues)
        }
        return points
    }
    
    // 대시를 체크하여 대시 기준으로 나눔
    private func splitByDash (_ input: String) -> Array<String> {
        var stringCoords = Array<String>()
        if input.contains("-") {
            stringCoords = input.split(separator: "-").map(String.init)
        } else {
            stringCoords.append(input)
        }
        return stringCoords
    }
    
    // 지원하는 캐릭터인지 체크
    private func isSupportedValues (_ input: String) -> Bool {
        let supportedCharacters = CharacterSet.init(charactersIn: "-(),0123456789")
        let filteredValue = input.trimmingCharacters(in: supportedCharacters)
        guard filteredValue.isEmpty else { return false }
        return true
    }
    
    // 문자열의 괄호를 제거
    private func eliminateParenthesis (_ stringCoord: String) -> String? {
        if stringCoord.contains("(") && stringCoord.contains(")") {
            let valueWithoutParenthesis = stringCoord.trimmingCharacters(in: ["(", ")"])
            return valueWithoutParenthesis
        } else {
            return nil
        }
    }
    
    // 콤마 기준으로 나눔
    private func splitInputValueByComma (_ input: String) -> Array<String>? {
        guard input.contains(",") else { return nil }
        let valueSplitedByComma = input.split(separator: ",").map(String.init)
        return valueSplitedByComma
    }
    
    // 문자열로된 숫자를 인트로 바꿈
    private func convertToInt (_ stringCoords: Array<String>) -> (Int, Int)? {
        let intValues = stringCoords.flatMap() { Int($0) }
        for index in 0 ..< intValues.count {
            if intValues[index] > 24 { return nil }
        }
        let numericValue = (intValues[0], intValues[1])
        return numericValue
    }
    
    private func makePointInstance (_ numericValues: Array<(Int, Int)> ) ->  Array<MyPoint> {
        var myPoints = Array<MyPoint>()
        for numericValue in numericValues {
            let myPoint = MyPoint(x: numericValue.0, y: numericValue.1)
            myPoints.append(myPoint)
        }
        return myPoints
    }
}
