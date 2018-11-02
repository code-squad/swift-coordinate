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
    func message() -> String {
        switch self {
        case .outOfRange: return "입력 범위를 확인해주세요. \(ANSICode.text.yellowBright)0=<x<25, 0=<y<25"
        case .invalidForm: return "입력 형식을 확인해주세요. \(ANSICode.text.yellowBright)입력 형식: (a,b)-(c,d)"
        case .incorrectCharacters: return "허용되지 않은 입력입니다. \(ANSICode.text.yellowBright)입력 형식: (a,b)-(c,d)"
        }
    }
}

class Validator {
    
    // 입력 가능한 케릭터셋
    static private let permittedCharacterSet = CharacterSet(charactersIn: ",-()").union(CharacterSet.decimalDigits)
    
    // 입력받은 값으로 캐릭터셋 만들기
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
        // 좌표 개수 제한
        return rawCoordinate.count % 2 == 0 && rawCoordinate.count < 5
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
            let validity = Validity.incorrectCharacters
            print(validity.message())
            return validity
        }
        let optionalNumericInputArray = CoordGenerator.makeNumericArrayBy(rawInput: rawCoordinate)
        if !isValidForm(of: optionalNumericInputArray) {
            let validity = Validity.invalidForm
            print(validity.message())
            return validity
        }
        if !isValidRange(of: optionalNumericInputArray) {
            let validity = Validity.outOfRange
            print(validity.message())
            return validity
        }
        return nil
    }
    
    
    
}

