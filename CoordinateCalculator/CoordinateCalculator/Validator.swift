//
//  InputControl.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 03/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Validator {
    
    static func validateFormatChecker(input: String) throws -> Bool {
       guard (input.first == "(" && input.last == ")" ) else {
            throw Error.removeValue
        }
        return true
    }
    
    static func validateRange(number: Int) throws {
        guard !(1...24).contains(number) else {
            return
        }
        throw Error.wrongValue
    }
}

enum Error: String,Swift.Error,CustomStringConvertible {
    var description: String { return self.rawValue }
    
    case wrongValue = "24까지의 좌표값만 입력해주세요"
    case removeValue = "(,)으로 값을 입력해주세요)"
    case notIntValue = "숫자로 입력해주세요"
    case wrongFormat = "포맷이 맞지 않습니다"
    case emptyValue = "값이 없습니다"

}
