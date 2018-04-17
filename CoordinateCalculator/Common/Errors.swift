//
//  Error+.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 4..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

enum CoordinateError: String, Error {
    case isNil = "입력 값이 없습니다."
    case regexError = "regex 형식을 확인 해주세요."
    case invalidInputError = "입력 형식을 지켜주세요."
    case imPossibleStringError = "입력 할 수 없는 문자가 있습니다."
    case splitError = "split이 형식이 아닙니다."
    case unknownCaseError = "점과 선이 아닙니다."
    case isRect = "직사각형이 아닙니다."
}
