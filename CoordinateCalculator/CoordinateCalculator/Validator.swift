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
    case outOfRange
    case invalidForm
    case valid
    
    // 검사결과에 따른 메세지
    func printMessage() {
        switch self {
        case .outOfRange: print("입력 범위는 0=<x<25, 0=<y<25 입니다")
        case .invalidForm: print("입력 형식은 (x,y)입니다")
        default: print("정상 입력입니다")
        }
    }
}

class Validator {
    
    // 입력값의 형식 조건
    private static func isValidForm(of rawCoordinate: [Int]) -> Bool {
        return rawCoordinate.count == 2
    }
    
    // 입력 값의 범위 조건
    private static func isValidRange(of rawCoordinate: [Int]) -> Bool {
        for element in rawCoordinate {
            guard element >= 0 && element < 25 else {return false}
        }
        return true
    }
    
    // 입력값 검사 후 결과 반환
    static func validate(rawCoordinate: [Int]) -> Validity {
        if !isValidForm(of: rawCoordinate) {
            return Validity.invalidForm
        }
        if !isValidRange(of: rawCoordinate) {
            return Validity.outOfRange
        }
        return Validity.valid
    }
    
    
    
}

