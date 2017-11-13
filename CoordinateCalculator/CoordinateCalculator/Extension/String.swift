//
//  String.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {
    func splitXY() -> [String] {
       return self.split(separator: ",").map({ (s: String.SubSequence) -> (String) in
            s.components(separatedBy: ["(", ")"]).joined()
        })
    }
    
    func trim() -> String {
        // 앞뒤 공백만 짜름, 중간 공백 처리를 하지 못함
        // return self.trimmingCharacters(in: )
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func match(for regex: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: regex) else {
            return false
        }
        
        return regex.matches(in: self, range: NSRange(self.startIndex..., in: self)).count > 0
    }
}
