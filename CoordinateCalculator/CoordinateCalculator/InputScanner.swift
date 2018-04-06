//
//  InputScanner.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 2..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputScanner {
    
    static let validPattern: String = "\\(([1-9]|1[0-9]|2[0-4]),([1-9]|1[0-9]|2[0-4])\\)"
    private let separator: Character = ","
    private let meaninglessCharacters: CharacterSet = ["(", ")"]
    
    
    func scan(text: String, pattern: String) throws -> String {
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

    // text는 이미 검증이 끝난 text를 넘길것
    func getCoordinateFrom(text: String) -> [Int] {
        let coordinate = text.split(separator: self.separator).map{ $0.trimmingCharacters(in: self.meaninglessCharacters) }.compactMap { Int($0) }
        
        return coordinate
    }
    
    func makeMyPointFrom(coordinates: [Int]) -> MyPoint {
        var myPoint = MyPoint()
        myPoint.x = coordinates[0]
        myPoint.y = coordinates[1]
        
        return myPoint
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
