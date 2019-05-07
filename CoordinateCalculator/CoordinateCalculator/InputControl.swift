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
    static func convertStringtoInt(input: String) throws ->[Int]{
        let inputArray = input.components(separatedBy: ",").compactMap{Int($0)}
        
        for input in inputArray {
            if !(1...24).contains(input) {
                throw Error.wrongValue
            }
        }
        return inputArray
    }
    
    enum Error: Swift.Error {
    case wrongValue
        var description: String {
            switch self {
            case .wrongValue: return "24까지의 좌표값만 입력해주세요"
            }
        }
    }
    
    
}


