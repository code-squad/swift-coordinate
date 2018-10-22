//
//  CheckUserInput.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct CheckUserInput {
    // 유저의 입력이 범위를 초과한 경우 ENUM 타입 리턴
    static func IsOverFlowNumber(notNilNumber1: Int, notNilNumber2: Int) -> ErrorState{
        guard notNilNumber1 > 24 || notNilNumber1 < 0 && notNilNumber2 > 24 || notNilNumber2 < 0 else {
            return .rightInput
        }
        return .overFlowNumber
    }
    
    // 유저의 입력의 상태를 검사하여 그에 맞는 ENUM 상태 리턴
    static func checkErrorState(positionX: String, positionY: String) -> ErrorState{
        guard Int(positionX) == nil || Int(positionY) == nil else {
            return CheckUserInput.IsOverFlowNumber(notNilNumber1: Int(positionX)!, notNilNumber2: Int(positionY)!)
        }
        return .nilNumber
    }
}
