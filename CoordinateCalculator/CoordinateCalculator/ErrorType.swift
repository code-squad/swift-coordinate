//
//  ErrorChecker.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 30..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation
struct ErrorType {
    enum InputCase: String, Error {
        case emptyInput = "좌표값을 반드시 입력해주세요."
        case wrongForm = "입력 형태는 (x,y)-(x,y)입니다."
        case overNumPoint = "좌표값은 24이하로 입력하세요."
        case lessNumPoint = "좌표값은 0이상으로 입력하세요."
    }
    
    enum ShapeCase: String, Error {
        case wrongLine = "직선을 생성할 수 없는 좌표입니다."
        case wrongTriangle = "삼각형을 생성할 수 없는 좌표입니다."
        case unexpected = "Unexpected Error"
    }
}
