//
//  InputScanner.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 2..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputScanner {
    
    static let validPattern: String = "\\(([0-9]|1[0-9]|2[0-4]),([0-9]|1[0-9]|2[0-4])\\)"
    
    func scan(text: String, pattern: String) throws -> String {
        let regex = try! NSRegularExpression(pattern: pattern)
        
        guard let firstRange = regex.firstMatch(in: text,
                                                options: [],
                                                range: NSMakeRange(0, text.count)) else {
            throw InputViewError.invalidInput
        }
        
        let matchedText: String = text[firstRange.range]
        
        if matchedText != text {
            throw InputViewError.invalidInput
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
