//
//  Error.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

enum CoordinatesError: Error, CustomStringConvertible {
    case emptyValue
    case outOfRangeCoordinate
    case notFormattedValue
    case exitProgram
    
    var description: String {
        switch self {
        case .emptyValue:
            return "입력값이 없습니다."
        case .outOfRangeCoordinate:
            return "입력값이 범위를 벗어났습니다. 0-24 사이값으로 입력하세요."
        case .notFormattedValue: 
            return "입력형식이 유효하지 않습니다."
        case .exitProgram:
            return "프로그램이 종료되었습니다."
        }
    }
}

