//
//  UserInputError.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 15/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum UserInputError:Error {
    case isNotString
    case inCorrectFormat
    case inCorrectItemNumber
    case canNotConvertTOInt
    case outOfRange
    case unknown
    
    var description: String{
        switch self{
        case .isNotString:
            return "잘못된 입력입니다."
        case .inCorrectFormat:
            return "잘못된 형식의 입력입니다."
        case .inCorrectItemNumber:
            return "좌표 값은 두개를 입력하세요."
        case .canNotConvertTOInt:
            return "정수를 입력하세요."
        case .outOfRange:
            return "표시할수 있는 좌표값을 벗어났습니다. "
        case .unknown:
            return "알 수 없는 오류가 발생했습니다."
        }
    }
}

