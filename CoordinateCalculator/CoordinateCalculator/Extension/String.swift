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
        // 앞뒤로 공백을 짜름 : return self.trimmingCharacters(in: )
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func match(for regex: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: regex) else {
            return false
        }
        
        return regex.matches(in: self, range: NSRange(self.startIndex..., in: self)).count > 0
    }
}
