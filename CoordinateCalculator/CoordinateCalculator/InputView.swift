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
    case regexError
    
    var localizedDescription: String {
        switch self {
        case .nilInput:
            return "입력이 비었습니다."
        case .invalidInput:
            return "잘못된 입력입니다."
        case .regexError:
            return "정규표현식이 잘못되었습니다."
        }
    }
}

enum Question: String {
    case coordinate = "좌표를 입력하세요.(ex: (1,1), 좌표범위: 1~24)"
}

struct InputView {
    
    static func readInput(question: String) -> String {
       print(question)
        
        guard let input = readLine() else {
            return ""
        }
        
        return input
    }
    
}
