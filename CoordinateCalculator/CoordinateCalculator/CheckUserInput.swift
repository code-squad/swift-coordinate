//
//  CheckUserInput.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct CheckUserInput {
    // Nil 값이 아닐 경우 범위에 맞는 값인지 검사
    static func IsOverFlowNumber(notNilNumber: Int) -> Bool{
        guard notNilNumber > 24 || notNilNumber < 0 else {
            return false
        }
        return true
    }
}
