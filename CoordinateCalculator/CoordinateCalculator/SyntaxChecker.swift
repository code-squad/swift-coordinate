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
    
    enum ErrorMessage: String, Error {
        case ofInValidInputedValue = "(x,y)형태로 입력해야 합니다."
        case ofNonexistenceComma = "x와 y의 값은 콤마로 구분되어야 합니다."
        case ofExceedValidInput = "x,y 각각 최대 입력가능한 값은 24입니다."
        case ofValueIsNotInt = "입력된 좌표가 숫자가 아닙니다."
        case ofUnKnownError = "알려지지 않은 에러입니다. 관리자에게 문의하세요."
    }
    
    func makeCheckedValues (_ input: String) throws -> MyShape {
        var userPoints : [MyPoint] = []
        let  temps = checkDashInInput(input)
        for index in temps {
            guard let temp2 = checkValid(index) else { throw ErrorMessage.ofValueIsNotInt}
            guard let temp = eliminateParenthesis(temp2) else { throw ErrorMessage.ofInValidInputedValue }
            guard let validValues = splitInputValueByComma(temp) else { throw ErrorMessage.ofNonexistenceComma }
            guard let valueOfInt = converToInt(validValues) else { throw ErrorMessage.ofExceedValidInput }
            userPoints.append(valueOfInt)
        }
        if userPoints.count == 1 {
            print(userPoints)
            return userPoints[0]
        } else if userPoints.count == 2 {
            return MyLine(pointA: userPoints[0], pointB: userPoints[1])
        } else {
            throw ErrorMessage.ofUnKnownError
        }
    }
    
    private func checkDashInInput (_ input: String) -> Array<String> {
        var temp = Array<String>()
        if input.contains("-") {
            temp = input.split(separator: "-").map(String.init)
        } else {
            temp.append(input)
        }
        return temp
    }
    
    private func checkValid (_ input: String) -> String? {
        let supportedCharacters = CharacterSet.init(charactersIn: "-(),0123456789")
        let filteredValue = input.trimmingCharacters(in: supportedCharacters)
        guard filteredValue.isEmpty else { return nil }
        return input
    }
    
    private func eliminateParenthesis (_ input: String) -> String? {
        var input = input
        if input.contains("(") && input.contains(")") {
            input = input.trimmingCharacters(in: ["(", ")"])
            return input
        } else {
            return nil
        }
    }
    
    private func splitInputValueByComma (_ input: String) -> Array<String>? {
        var temp = Array<String>()
        guard input.contains(",") else { return nil }
        temp = input.split(separator: ",").map(String.init)
        return temp
    }
    
    private func converToInt (_ input: Array<String>) -> MyPoint? {
        let temp = input.flatMap{ tempValue in Int(tempValue) }
        for index in 0 ..< temp.count {
            guard temp[index] <= 24 else { return nil }
        }
        return MyPoint(x: temp[0], y: temp[1])
    }
}
