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
    case incorrectCharacters
    
    // 검사결과에 따른 메세지
    func printMessage() {
        switch self {
        case .outOfRange: print("입력 범위는 0=<x<25, 0=<y<25 입니다")
        case .invalidForm: print("입력 형식을 확인해주세요")
        default: print("정상 입력입니다")
        }
    }
}

class Validator {
    
    // 입력 가능한 문자 셋
    
    static private let permittedCharacterSet = CharacterSet(charactersIn: ",-()").union(CharacterSet.decimalDigits)
    
    // 입력받은 값으로 캐릭터 셋 만들기
    static private func makeCharacterSet(of rawString: String) -> CharacterSet {
        return CharacterSet(charactersIn: rawString)
    }
    
    //허용된 문자로 이뤄져 있는지
    static private func isCorrectCharactors(in rawInput: String) -> Bool {
        return makeCharacterSet(of: rawInput).isSubset(of: permittedCharacterSet)
    }
    
    // 숫자로 변환한 값의 형식 조건 확인 (nil이 있거나 홀수거나)
    static private func isValidForm(of rawCoordinate: [Int?]) -> Bool {
        for element in rawCoordinate {
            guard element != nil else {return false}
        }
        return rawCoordinate.count % 2 == 0
    }
    
    // 입력 값의 범위 조건
    static private func isValidRange(of rawCoordinate: [Int?]) -> Bool {
        for element in rawCoordinate {
            let unwrappedElement = element ?? -1
            guard unwrappedElement >= 0 && unwrappedElement < 25 else {return false}
        }
        return true
    }
    
    // 입력값 검사 후 결과 반환
    static func validate(rawCoordinate: String) -> Validity? {
        if !isCorrectCharactors(in: rawCoordinate) {
            return Validity.incorrectCharacters
        }
        let optionalNumericInputArray = InputView.makeNumericArrayBy(rawInput: rawCoordinate)
        if !isValidForm(of: optionalNumericInputArray) {
            return Validity.invalidForm
        }
        if !isValidRange(of: optionalNumericInputArray) {
            return Validity.outOfRange
        }
        return nil
    }
    
    
    
}

