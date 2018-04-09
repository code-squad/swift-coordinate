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
}
