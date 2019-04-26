//
//  ErrorMessage.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum ErrorMessage : String, Error {
    case noValueError = "올바른 값을 입력하세요"
    case typeMissError = "정수를 입력하세요"
    case outOfRangeError = "범위를 넘었습니다"
    case nonbracket = "소괄호를 씌워주세요"
    case noRectangle = "네 점이 직사각형이 되지 않습니다"
}
