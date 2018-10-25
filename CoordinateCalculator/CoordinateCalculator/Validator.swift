//
//  Error.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 24..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

//검사결과, 유효성
enum Validity {
    case outRange
    case invalidForm
    case valid
    
    // 검사결과에 따른 메세지
    func printMessage() {
        switch self {
        case .outRange: print("입력 범위는 0=<x<25, 0=<y<25 입니다")
        case .invalidForm: print("입력 형식은 (x,y)입니다")
        default: print("정상 입력입니다")
    }
}
}

class Validator {
    
    // 입력값의 형식 조건
    private static func checkWrongForm(inputNumbers: [Int]) -> Bool {
        return inputNumbers.count != 2
    }
    
    // 입력 값의 범위 조건
    private static func checkWrongRange(inputNumbers: [Int]) -> Bool {
        for number in inputNumbers {
            if number < 0 || number > 24 {return true}
        }
        return false
    }
    
    // 입력값 검사 후 결과 반환
    static func checkInputValidity(numberInput: [Int]) -> Validity {
        if checkWrongForm(inputNumbers: numberInput) {
            return Validity.invalidForm
        }
        if checkWrongRange(inputNumbers: numberInput) {
            return Validity.outRange
        }
        return Validity.valid
    }
    
    
    
}

