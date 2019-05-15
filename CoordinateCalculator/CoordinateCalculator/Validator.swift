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
        if (input.first == "(" && input.last == ")" ) {
            return true
        }
        throw Error.wrongValue
    }

    static func validateRange(number: Int) throws {
        if !(1...24).contains(number){
            throw Error.wrongValue
        }
    }
}

enum Error: Swift.Error {
    case wrongValue
    case removeValue
    case notIntValue
    case wrongFormat
    case emptyValue
    
    var description: String {
        switch self {
        case .wrongValue: return "24까지의 좌표값만 입력해주세요"
        case .removeValue: return "(,)으로 값을 입력해주세요)"
        case .notIntValue: return "숫자로 입력해주세요"
        case .wrongFormat: return "포맷이 맞지 않습니다"
        case .emptyValue: return "값이 없습니다"
        }
    }
}
