//
//  CheckUserInput.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct CheckUserInput {
    
    // 입력 값이 Nil 값인지 검사 후 아닌 경우 범위에 맞는지 검사
    func IsRightUserInput(input : Int?) -> Bool {
        if input == nil{
            return true
        }
        return IsOverFlowNumber(notNilNumber: input!)
    }
    
    // Nil 값이 아닐 경우 범위에 맞는 값인지 검사
    private func IsOverFlowNumber(notNilNumber: Int) -> Bool{
        guard notNilNumber > 24 || notNilNumber < 0 else {
            return false
        }
        return true
    }
}
