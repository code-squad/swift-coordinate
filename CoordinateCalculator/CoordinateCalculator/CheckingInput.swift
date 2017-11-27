//
//  CheckingInput.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 17..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct CheckingInput {

    enum ErrorCase: String, Error {
        case emptyInput = "좌표값을 반드시 입력해주세요."
        case wrongForm = "입력 형태는 (x,y)-(x,y)입니다."
        case overNumPoint = "좌표값은 24이하로 입력하세요."
        case lessNumPoint = "좌표값은 0이상으로 입력하세요."
    }
    
    let validCharacters = CharacterSet.init(charactersIn: "0123456789,()-")
    
    func checkPointNums (_ inputValue: String?) throws -> [String] {
        //let userInput = inputValue ?? ""
        guard let userInput = inputValue else { return [] }
        var inputPoints : [String] = []
        
        // 1. 사용자 입력이 공백일 경우 에러체크
        if userInput == "" {
            throw ErrorCase.emptyInput
        }
        
        // 2. CharacterSet에 있는 문자 이외의 것이 들어있는지 에러체크
        let filter = userInput.trimmingCharacters(in: validCharacters)
        if !filter.isEmpty {
            throw ErrorCase.wrongForm
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
                throw ErrorCase.emptyInput
            }
        }
        return inputPoints
    }
    
    func checkError (_ inputValues: [String]) throws -> [(Int, Int)] {
        var checkedValues : [(Int, Int)] = []
        var userPoints : [Int] = []
        
        // 4. 사용자 입력이 (,) 형태가 아닐경우 에러체크, 형태가 맞다면 사용자 좌표값 MyPoint 매칭
        for inputValue in inputValues {
            if inputValue.hasPrefix("(") && inputValue.hasSuffix(")") {
                let noBlanks = inputValue.trimmingCharacters(in: ["(", ")"])
                if noBlanks.contains(",") {
                    userPoints = noBlanks.split(separator: ",").map({(value: String.SubSequence) -> Int in Int(value)!})
                } else {
                    throw ErrorCase.wrongForm }
            } else {
                throw ErrorCase.wrongForm }
            // 5. 사용자 입력 좌표값이 24가 넘을경우 에러체크
            if userPoints[0] >= 24 || userPoints[1] >= 24 {
                throw ErrorCase.overNumPoint
            }
            // 6. 사용자 입력 좌표값이 0 이하일 경우 에러체크
            if userPoints[0] <= 0 || userPoints[1] <= 0 {
                throw ErrorCase.lessNumPoint
            }
            checkedValues.append((userPoints[0], userPoints[1]))
        }
        return checkedValues
    }

}
