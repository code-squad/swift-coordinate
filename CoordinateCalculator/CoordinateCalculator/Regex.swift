//
//  Regex.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
/// 정규식이 담겨있는 구조체
struct Regex {
    /// 좌표값만 추출하는 정귝식표현
    static let forNumberCheck = "[0-9]{1,}"
    /// 좌표1개 추출 정규식표현
    static let forPointCheck = "\\("+forNumberCheck+"\\,"+forNumberCheck+"\\)"
    /// 라인추출용 정규식 표현
    static let forLineCheck = forPointCheck+"\\-"+forPointCheck
    /// 삼각형 추출용 정규식 표현
    static let forTriangle = forLineCheck+"\\-"+forPointCheck
    /// 사각형 추출용 정규식 표현
    static let forRectangle = forTriangle+"\\-"+forPointCheck
}
