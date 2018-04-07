//
//  InputScanner.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 2..
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

struct InputChecker {
    
    static let validPattern: String = "\\(([1-9]|1[0-9]|2[0-4]),([1-9]|1[0-9]|2[0-4])\\)"
    
    func checkMatching(text: String, with pattern: String) throws -> String {
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            throw InputError.regexError
        }
        
        guard let firstRange = regex.firstMatch(in: text,
                                                options: [],
                                                range: NSMakeRange(0, text.count)) else {
            throw InputError.invalidInput
        }
        
        let matchedText: String = text[firstRange.range]
        
        // 지정한 포맷 외에 다른 포맷이 붙어있는 입력이라면 에러
        if matchedText != text {
            throw InputError.invalidInput
        }
        
        return matchedText
    }
}


// NSRange로부터 String을 만들기 위해 서브스크립트 사용
extension String {
    public subscript(range: NSRange) -> String {
        let start = self.index(self.startIndex, offsetBy: range.location)
        let end = self.index(start, offsetBy: range.length)
        
        return String(self[start..<end])
    }
}
