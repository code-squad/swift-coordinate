//
//  Validation.swift
//  CoordinateCalculator
//
//  Created by RENO1 on 24/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Validation {
    fileprivate static let INVALID_COORDINATE_VALUE = -1
    fileprivate static let MAX_COORDINATE_VALUE = 24
    fileprivate static let ERROR_MESSAGE_INPUTLINE_NILL = "아무것도 입력하지 않았습니다. 다시 입력해주세요"
    fileprivate static let ERROR_MESSAGE_COORDINATE_NILL = "아무것도 입력되지 않은 좌표가 있습니다. 다시 입력해주세요"
    fileprivate static let ERROR_MESSAGE_IS_OVER_VALUE = "24를 초과된 좌표값이 있습니다. 다시 입력해주세요"
    fileprivate static let VALID_CHAR_SET:CharacterSet = ["(",",",")","-"]
    
    static func isValidInputLine(inputLine:String?) -> Bool {
        if inputLine == nil {
            OutputView.showErrorMessage(errorCase: ErrorCase.NILL_INPUT_LINE)
            return false
        }
        
        if !isValidPoint(inputLine: inputLine) {
            return false
        }
        
        return true
    }
    
    static func isValidPoint(inputLine:String?) -> Bool {
        let array = inputLine!.components(separatedBy: VALID_CHAR_SET)
        for (index, stringValue) in array.enumerated() {
            print("\(stringValue) , \(index)")
            
            if(index == 0 || index == array.count - 1) {
                continue
            }
            
            let intValue = Int(stringValue) ?? INVALID_COORDINATE_VALUE
            
            if(intValue == INVALID_COORDINATE_VALUE){
                OutputView.showErrorMessage(errorCase: ErrorCase.NILL_INPUT_VALUE)
                return false
            }
            
            if(intValue > MAX_COORDINATE_VALUE) {
                OutputView.showErrorMessage(errorCase: ErrorCase.OVER_MAX_VALUE)
                return false
            }
        }
        
        return true
    }
    
    static func isValidCharacterSet(inputLine:String) -> Bool {
        for character in Array(inputLine) {
            // 숫자가 이거나
            if !isNumber(character: character) {
                
                return false
            }
            
            // "(" , "," , ")" 인 경우 -> true
            if !isValidCharacterSet(characterSet: VALID_CHAR_SET) {
                
                return false
            }
        }
        
        return true
    }
    
    static func isNumber(character:Character) -> Bool {
        if((48...57).contains(UnicodeScalar(character).value)){
            return true
        }
        
        return false
    }
    
    static func isValidCharacterSet(characterSet:CharacterSet) -> Bool {
        
    }

}


extension String {
    var isNumeric: Bool {
        for c in utf8 where !((48...57) ~= c) {
            return true
            
        }
        return false
    }
}
