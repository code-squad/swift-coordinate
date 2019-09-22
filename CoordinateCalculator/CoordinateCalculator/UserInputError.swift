//
//  UserInputError.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum UserInputError: LocalizedError {
    
    case wrongInputFormat(message: String)
    case internalError
    case alreadyExist
    case exceedMaxUserInput
    case inputParsingError
    
    var errorDescription: String? {
        switch self {
        case .wrongInputFormat(let message) :
            return "잘못된 형식입니다:\(message)"
        case .internalError :
            return "내부 에러 발생"
        case .alreadyExist :
            return "동일한 데이터가 존재합니다"
        case .exceedMaxUserInput :
            return "입력 횟수 한도를 초과 했습니다."
        case .inputParsingError :
            return "입력값 분석중 에러가 발생했습니다"
        }
    }
}
