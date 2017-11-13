//
//  Error.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

enum CoordinatesError: String, Error {
    case emptyValue = "입력값이 없습니다."
    case outOfRangeCoordinate = "입력값이 범위를 벗어났습니다. 0-24 사이값으로 입력하세요."
    case notFormattedValue = "입력형식이 유효하지 않습니다."
}

