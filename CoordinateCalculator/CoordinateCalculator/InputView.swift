//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 3. 30..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation


enum InputError: Error {
    case nilInput
    case invalidInput
    
    var localizedDescription: String {
        switch self {
        case .nilInput:
            return "입력이 비었습니다."
        case .invalidInput:
            return "잘못된 입력입니다."
        }
    }
}

struct InputView {
    
    static func readInput() throws -> String {
        print("좌표를 입력하세요.")
        
        guard let input = readLine() else {
            throw InputError.nilInput
        }
        
        return input
    }
    
}
