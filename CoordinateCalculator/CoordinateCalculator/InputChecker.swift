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
    
    func validateInput (_ inputValue: String?) throws -> [String] {
        //let userInput = inputValue ?? ""
        guard let userInput = inputValue else { return [] }
        var inputPoints : [String] = []
        
        // 1. 사용자 입력이 공백일 경우 에러체크
        if userInput == "" {
            throw InputError.emptyInput
        }
        
        // 2. CharacterSet에 있는 문자 이외의 것이 들어있는지 에러체크
        let filter = userInput.trimmingCharacters(in: validCharacters)
        if !filter.isEmpty {
            throw InputError.wrongForm
        }
       
        // "-"의 유무에 따라서 입력좌표 리스트 구하기
        if userInput.contains("-") {
           let points = userInput.split(separator: "-")
            inputPoints = points.map({(value: String.SubSequence) -> String in String(value)})
        } else {
            inputPoints.append(userInput)
        }
        
        // 3. 입력한 좌표가 공백일 경우 에러체크 - map이나 filter로 바꾸기
        for point in inputPoints {
            if point == "" {
                throw InputError.emptyInput
            }
        }
        return inputPoints
    }

    func filterValidPoints (_ inputValues: [String]) throws -> [(Int, Int)] {
        var checkedValues : [(Int, Int)] = []
        var userPoints : [Int] = []
        
        // 4. 사용자 입력이 (,) 형태가 아닐경우 에러체크, 형태가 맞다면 사용자 좌표값 MyPoint 매칭
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
