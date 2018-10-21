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
//    static func IsOverFlowNumber(notNilNumber: Int) -> Bool{
//        guard notNilNumber > 24 || notNilNumber < 0 else {
//            return false
//        }
//        return true
//    }
    static func IsOverFlowNumber(notNilNumber1: Int, notNilNumber2: Int) -> stateInput{
        guard notNilNumber1 > 24 || notNilNumber1 < 0 && notNilNumber2 > 24 || notNilNumber2 < 0 else {
            return .rightInput
        }
        return .overFlowNumber
    }
    
    static func returnInputState(positionX: String, positionY: String) -> stateInput{
        guard Int(positionX) == nil || Int(positionY) == nil else {
            return CheckUserInput.IsOverFlowNumber(notNilNumber1: Int(positionX)!, notNilNumber2: Int(positionY)!)
        }
        return .nilNumber
    }
}
