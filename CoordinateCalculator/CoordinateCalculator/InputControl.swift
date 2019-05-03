//
//  InputControl.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 03/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

// 내 함수의 소속 구분 위해 struct
struct InputControl {
    static func convertStringtoInt(input: String) -> [Int]{
    let inputArray = input.components(separatedBy: ",").compactMap{Int($0)}
    return inputArray
    }
    
}



