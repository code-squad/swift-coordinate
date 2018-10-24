//
//  Error.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 24..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

class Error {
    
    // 입력받는 값이 형식에 맞는지 검사
    private static func checkWrongForm(inputNumbers: [Int]) -> Bool {
        return inputNumbers.count != 2
    }
    
    // 입력받는 값이 범위에 맞는지 검사
    private static func checkWrongRange(inputNumbers: [Int]) -> Bool {
        for number in inputNumbers {
            if number < 0 || number > 24 {return true}
        }
        return false
    }
    
    // 입력값 검사 후 문구 출력, 결과 반환
    static func checkInputError(numberInput: [Int]) -> Bool {
        if checkWrongForm(inputNumbers: numberInput) {
            print("입력 형식은 (x,y)입니다")
            return true
        }
        if checkWrongRange(inputNumbers: numberInput) {
            print("입력 범위는 0=<x<25, 0=<y<25 입니다")
            return true
        }
        return false
    }
    
}

