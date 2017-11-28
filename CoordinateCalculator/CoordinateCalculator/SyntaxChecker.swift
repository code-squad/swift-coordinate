//
//  SyntaxChecker.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct SyntaxChecker {
    
    enum Shape {
        case point
        case line
    }
    
    // 에러 메세지를 갖는 enum선언
    enum ErrorMessage: String, Error {
        case ofInValidInputedValue = "(x,y)형태로 입력해야 합니다."
        case ofNonexistenceComma = "x와 y의 값은 콤마로 구분되어야 합니다."
        case ofExceedValidInput = "x,y 각각 최대 입력가능한 값은 24입니다."
        case ofValueIsNotInt = "입력된 좌표가 숫자가 아닙니다."
        case ofUnKnownError = "알려지지 않은 에러입니다. 관리자에게 문의하세요."
    }
    
    // 체크된 값을 받아 Myshape객체 생성
    func makeCheckedValues (_ input: String) throws -> MyShape {
        var userPoints = try checkValue(input)
        if userPoints.count == 1 {
            return userPoints[0]
        } else if userPoints.count == 2 {
            return MyLine(pointA: userPoints[0], pointB: userPoints[1])
        } else {
            throw ErrorMessage.ofUnKnownError
        }
    }
    
    // 값들을 체크하여 MyPoint 배열로 반환
     func checkValue (_ input: String) throws -> Array<MyPoint> {
        var userPoints : [MyPoint] = []
        let  temps = splitByDash(input)
        for index in temps {
            guard let supportedValue = checkIsSupportedValues(index) else { throw ErrorMessage.ofValueIsNotInt}
            guard let valueWithoutParenthesis = eliminateParenthesis(supportedValue) else { throw ErrorMessage.ofInValidInputedValue }
            guard let valueSplitedByComma = splitInputValueByComma(valueWithoutParenthesis) else { throw ErrorMessage.ofNonexistenceComma }
            guard let checkedValue = converToInt(valueSplitedByComma) else { throw ErrorMessage.ofExceedValidInput }
            userPoints.append(checkedValue)
        }
        print(userPoints)
        return userPoints
    }
    
    // 대시를 체크하여 대시 기준으로 나눔
     private func splitByDash (_ input: String) -> Array<String> {
        var temp = Array<String>()
        if input.contains("-") {
            temp = input.split(separator: "-").map(String.init)
        } else {
            temp.append(input)
        }
        return temp
    }
    
    // 지원하는 캐릭터인지 체크
     private func checkIsSupportedValues (_ input: String) -> String? {
        let supportedCharacters = CharacterSet.init(charactersIn: "-(),0123456789")
        let filteredValue = input.trimmingCharacters(in: supportedCharacters)
        guard filteredValue.isEmpty else { return nil }
        return input
    }
    
    // 문자열의 괄호를 제거
    private func eliminateParenthesis (_ input: String) -> String? {
        var input = input
        if input.contains("(") && input.contains(")") {
            input = input.trimmingCharacters(in: ["(", ")"])
            return input
        } else {
            return nil
        }
    }
    
    // 콤마 기준으로 나눔
    private func splitInputValueByComma (_ input: String) -> Array<String>? {
        var temp = Array<String>()
        guard input.contains(",") else { return nil }
        temp = input.split(separator: ",").map(String.init)
        return temp
    }
    
    // 문자열로된 숫자를 인트로 바꿔서 MyPoint객체 생성
      func converToInt (_ input: Array<String>) -> MyPoint? {
        let temp = input.flatMap{ tempValue in Int(tempValue) }
        for index in 0 ..< temp.count {
            guard temp[index] <= 24 else { return nil }
        }
        print(MyPoint(x: temp[0], y: temp[1]))
        return MyPoint(x: temp[0], y: temp[1])
    }
}
