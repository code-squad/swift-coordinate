//
//  CustomErrors.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct CustomErrors {
    enum InputError : Error {
        case invalidCharacter // "입력값에 유효하지 않은 문자 혹은 기호가 들어가 있습니다."
        case invalidRange // "숫자는 1부터 24까지 가능합니다."
        case wrongPoint // "좌표 입력이 올바르지 않습니다."
        case samePoint // "좌표가 중복 됩니다."
        case invalidRect // "직사각형의 좌표를 입력해주세요."
    }
}
