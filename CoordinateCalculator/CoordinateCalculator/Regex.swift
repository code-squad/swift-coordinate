//
//  RegularExpression.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 11..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
/// 정규식이 담겨있는 구조체
struct Regex {
    // row 값 추출
    static let extractedRow = "[0-9]{1,2}"
    // ; +  col 값 추출
    static let extractedCol = ";[0-9]{1,2}"
    // Bool 구분자 + 본문 추출값
    static let extractedLatters = "[ft]([━]*[\\s]*[0-9]*[\\|\\+]?)"
    //전체 정규식
    static let extractAll = extractedRow + extractedCol + extractedLatters
}
