//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 3. 30..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation


enum InputViewError: Error {
    case nilInput
    case invalidInput
    
    var localizedDescription: String {
        switch self {
        case .nilInput:
            return "입력을 확인해주세요."
        case .invalidInput:
            return "잘못된 입력입니다."
        }
    }
}

struct InputView {
    
    static func readInput() throws -> String {
        print("좌표를 입력하세요.")
        
        guard let input = readLine() else {
            throw InputViewError.nilInput
        }
        
        return input
    }
    
}
