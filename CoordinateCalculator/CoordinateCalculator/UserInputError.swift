//
//  UserInputError.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum UserInputError:Error {
    case inCorrectFormat
    case inCorrectItemNumber
    case canNotConvertToInt
    case outOfRange
    case isNotFigure
    case canNotDrawLine
    case canNotDrawTriangle
    case canNotDrawRect
    case unknown
    
    var description: String{
        switch self{
        case .inCorrectFormat:
            return "잘못된 형식의 입력입니다."
        case .inCorrectItemNumber:
            return "좌표 값은 두개를 입력하세요."
        case .canNotConvertToInt:
            return "정수를 입력하세요."
        case .outOfRange:
            return "표시할수 있는 좌표값을 벗어났습니다. "
        case .unknown:
            return "알 수 없는 오류가 발생했습니다."
        case .isNotFigure:
            return "출력 가능한 점이 없습니다."
        case .canNotDrawLine:
            return "두개의 점이 겹쳐 있어 직선을 표현할 수 없습니다."
        case .canNotDrawTriangle:
            return "세점이 한직선 위에 있어 삼각형을 표현할 수 없습니다."
        case .canNotDrawRect:
            return "사각형을 표시할 수 없습니다."
        }
    }
}
