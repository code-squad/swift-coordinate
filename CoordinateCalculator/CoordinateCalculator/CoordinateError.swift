//
//  CoordinateError.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum CoordinateError: String, Error {
    case invalidInputFormat  = "잘못된 형식의 입력입니다. 다시 입력해주세요."
    case impossibleToParse   = "변환 불가능한 입력입니다. 다시 입력해주세요. "
    case outOfAxisRange      = "좌표 범위를 벗어난 입력입니다. 다시 입력해주세요. "
    case impossibleToConvert = "정수로 변환할 수 없습니다. 다시 입력해주세요."
}

