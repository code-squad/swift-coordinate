//
//  Error.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Exception {
    
    enum ErrorType:String,Error{
        case wrongFormat = "올바른 입력형식이 아닙니다."
        case outOfRange = "입력 범위를 벗어났습니다."
    }
    
    static func alertError(type:ErrorType){
        print("===============================")
        print("=      \(type.rawValue)       =")
        print("===============================")
        print("---------- 재시작 합니다 ----------")
    }
    
    
}
