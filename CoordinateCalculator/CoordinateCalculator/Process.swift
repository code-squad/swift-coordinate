//
//  Process.swift
//  CoordinateCalculator
//
//  Created by JH on 10/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum ErrorMessage: Error, CustomStringConvertible {
    case noInputValue
    case incorrectFormet
    case incorrectInputValue
    case incorrectInputValueCount
    case rangeOver
    case unknown
    
    var description: String {
        switch self {
        case .noInputValue:
            return "입력값이 없습니다. 값을 입력해주세요."
        case .incorrectFormet:
            return "입력형식이 잘못됐습니다. 괄호안에 좌표를 입력해주세요."
        case .incorrectInputValue:
            return "숫자를 입력해주세요."
        case .incorrectInputValueCount:
            return "(x,y) 두값을 입력해주세요."
        case .rangeOver:
            return "입력범위를 초과했습니다. 0~24 범위안에서 입력해주세요."
        case .unknown:
            return "알수없는 오류입니다"
        }
    }
}

struct Process {
    
    static func checkFormat(inputValue: String) throws -> [String] {
        var inputValue = inputValue
        guard inputValue.first == "(" , inputValue.last == ")" else {
            throw ErrorMessage.incorrectFormet //형식
        }
        inputValue.removeFirst()
        inputValue.removeLast()
        
        let checkValues = inputValue.split(separator: ",", omittingEmptySubsequences: false).map{String($0)}
        guard checkValues.count != 1 else {
            throw ErrorMessage.incorrectInputValueCount//형식
        }
        guard checkValues[1] != "" else {
            throw ErrorMessage.incorrectFormet //형식
        }
        guard checkValues.count == 2 else {
            throw ErrorMessage.incorrectInputValueCount //형식
        }
        return checkValues
    }
    
    static func convertForm(values: [String]) throws -> (x: Int, y: Int) {
        let intValues = try values.map {(value: String) -> Int in
            guard let intValue = Int(value) else {
                throw ErrorMessage.incorrectInputValue
            }
            return intValue
        }
        guard intValues[0] <= 24, intValues[1] <= 24 else {
            throw ErrorMessage.rangeOver
        }
        guard intValues[0] >= 0, intValues[1] >= 0 else {
            throw ErrorMessage.rangeOver
        }
        return (x: intValues[0], y: intValues[1])
    }
}


