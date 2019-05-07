//
//  CoordinateError.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol CoordinateError: Error {
    var message: String { get }
}

enum InputFormatError: String, CoordinateError {
    case invalidFormat = "잘못된 입력입니다 - 형식에 맞지 않는 문자가 포함되어 있습니다."
    case invalidParenthesis = "잘못된 입력 값 - 괄호"
    case impossibleTodivideByComma = "잘못된 입력 값 - 쉼표"
    
    var message: String {
        return self.rawValue
    }
}

enum ConverterError: String, CoordinateError {
    case impossibleToConvert = "숫자로 변환할 수 없습니다."
    
    var message: String {
        return self.rawValue
    }
}

enum AxisError: String, CoordinateError {
    case outOfAxisRange = "좌표범위를 벗어났습니다. 다시 입력해주세요."
    
    var message: String {
        return self.rawValue
    }
}

enum FactoryError: String, CoordinateError {
    case impossibleToCreateInstance = "instance 생성 불가"
    case isNotRectangle = "직/정사각형이 아닙니다."
    case invalidRectXY = "잘못된 사각형 좌표입니다."
    
    var message: String {
        return self.rawValue
    }
}

