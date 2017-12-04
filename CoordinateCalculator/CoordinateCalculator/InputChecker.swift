//
//  CheckingInput.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 17..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputChecker {
    
    enum InputError: String, Error {
        case emptyInput = "좌표값을 반드시 입력해주세요."
        case wrongForm = "입력 형태는 (x,y)-(x,y)입니다."
    }
    
    let validCharacters = CharacterSet.init(charactersIn: "0123456789,()-")
    
    func validInput (_ inputValue: String?) throws -> [(Int, Int)]{
        let inputCheckedNil = try inputIsNil(inputValue)
        let inputValidChars = try hasValidChars(inputCheckedNil)
        let inputPoints = try splitIntoPoints(inputValidChars)
        let validPoints = try filterValidPoints(inputPoints)
        return validPoints
    }
    
    // 1. 사용자 입력이 공백일 경우 에러체크
    private func inputIsNil (_ inputValue: String?) throws -> String {
        let userInput = inputValue ?? ""
        if userInput == "" {
            throw InputError.emptyInput
        }
        return userInput
    }
    
    // 2. CharacterSet에 있는 문자 이외의 것이 들어있는지 에러체크
    private func hasValidChars (_ userInput: String) throws -> String {
        let filter = userInput.trimmingCharacters(in: validCharacters)
        if filter.isEmpty {
            return userInput
        }
        throw InputError.wrongForm
    }
    
    // 3. "-"의 유무에 따라서 입력좌표 리스트 구하기
    private func splitIntoPoints (_ userInput: String) throws -> [String]{
        var inputPoints : [String] = []
        if userInput.contains("-") {
            let points = userInput.split(separator: "-")
            inputPoints = points.map({(value: String.SubSequence) -> String in String(value)})
        } else {
            inputPoints.append(userInput)
        }
        return inputPoints
    }
    
    // 4. 사용자 입력이 (,) 형태가 아닐경우 에러체크, 형태가 맞다면 사용자 좌표값 MyPoint 매칭
    private func filterValidPoints (_ inputValues: [String]) throws -> [(Int, Int)] {
        var checkedValues : [(Int, Int)] = []
        var userPoints : [Int] = []
        
        for inputValue in inputValues {
            if inputValue.hasPrefix("(") && inputValue.hasSuffix(")") {
                let noBlanks = inputValue.trimmingCharacters(in: ["(", ")"])
                if noBlanks.contains(",") {
                    userPoints = noBlanks.split(separator: ",").map({(value: String.SubSequence) -> Int in Int(value)!})
                } else {
                    throw InputError.wrongForm }
            } else {
                throw InputError.wrongForm }
            checkedValues.append((userPoints[0], userPoints[1]))
        }
        return checkedValues
    }
    
}
