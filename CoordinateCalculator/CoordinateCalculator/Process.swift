//
//  Process.swift
//  CoordinateCalculator
//
//  Created by JH on 10/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum ErrorMessage: Error {
    case noInput
    case incorrectFormet
    case incorrectInput
    case rangeOver
    
    var description: String {
        switch self {
        case .noInput:
            return "입력값이 없습니다"
        case .incorrectFormet:
            return "입력형식이 잘못됐습닙다"
        case .incorrectInput:
            return "숫자를 입력해주세요"
        case .rangeOver:
            return "입력범위를 초과했습니다"
        }
    }
}

struct Process {
    
    //입력받은 좌표값 형식확인
    static func checkFormat(inputValue: String) throws -> String {
        var inputValue = inputValue
        guard inputValue.first == "(" , inputValue.last == ")" else {
            throw ErrorMessage.incorrectFormet
        }
        
        inputValue.removeFirst()
        inputValue.removeLast()
        
        return inputValue
    }
    
    
    static func trimAndSplit(inputValue: String) -> [String] {
        let trimmedValue = inputValue.trimmingCharacters(in: ["(",")"])
        let splitedValues = trimmedValue.components(separatedBy: ",")
        
        return splitedValues
    }

    
    static func makeCoordinateValueFrom(inputs: [String])throws -> (x: Int,y: Int) {
        guard let xValue = Int(inputs[0]), let yValue = Int(inputs[1]) else {
            throw ErrorMessage.incorrectInput
        }
        
        return (x: xValue, y: yValue)
    }

}


