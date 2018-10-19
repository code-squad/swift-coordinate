//
//  CheckUserInput.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct CheckUserInput {
    
    // UserInput이 0 <= input < 25 사이의 숫자인지 검사
    static func IsOverFlowNumber(position : Int) -> Bool {
        guard position > 24 || position < 0 else {
            return false
        }
        print("입력 범위를 초과하였습니다")
        return true
    }
}
