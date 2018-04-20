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
    /// 정규식화용 정규식표현
    static let forInputCheck = "\\([0-9]{1,2}\\,[0-9]{1,2}\\)"
    /// 좌표값만 추출하는 정귝식표현
    static let forAxisCheck = "[0-9]{1,2}"
}
