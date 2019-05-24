//
//  Process.swift
//  CoordinateCalculator
//
//  Created by JH on 10/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum UserInputError: Error, CustomStringConvertible {
    case noInputValue
    case incorrectFormat
    case incorrectInputValue
    case incorrectInputValueCount
    case rangeOver
    case unknown
    
    var description: String {
        switch self {
        case .noInputValue:
            return "입력값이 없습니다. 값을 입력해주세요."
        case .incorrectFormat:
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

struct Validify {
    
    static func validify(coordinateValue: String) throws -> (x: Int, y: Int) {
        let correctFormatValues = try checkFormat(inputValue: coordinateValue)
        let result = try convertForm(intValues: correctFormatValues)
        
        return result
    }
    
    static func checkFormat(inputValue: String) throws -> (x: Int, y: Int) {
        var inputValue = inputValue
        guard inputValue.first == "(" , inputValue.last == ")" else {
            throw UserInputError.incorrectFormat //형식
        }
        inputValue.removeFirst()
        inputValue.removeLast()
        
        let checkValues = inputValue.split(separator: ",", omittingEmptySubsequences: false).map{String($0)}
        guard checkValues.count == 2 else {
            throw UserInputError.incorrectInputValueCount//형식
        }
        
        let intValues = try checkValues.map { (value: String) -> Int in
            guard let intValue = Int(value) else {
                throw UserInputError.incorrectInputValue
            }
            return intValue
        }
        return (x: intValues[0], y: intValues[1])
    }
    
    static func convertForm(intValues: (Int,Int)) throws -> (x: Int, y: Int) {

        guard intValues.0 <= 24, intValues.1 <= 24 else {
            throw UserInputError.rangeOver
        }
        guard intValues.0 >= 0, intValues.1 >= 0 else {
            throw UserInputError.rangeOver
        }
        return (x: intValues.0, y: intValues.1)
    }
}


