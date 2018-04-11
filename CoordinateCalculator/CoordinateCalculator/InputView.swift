//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 3. 30..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum Question: String {
    case coordinate = "좌표를 입력하세요."
}

struct InputView {
    
    static private let invalidCharacters = CharacterSet(charactersIn: "0123456789-,()")
    
    static func readInput(question: String) -> String {
       print(question)
        guard let input = readLine() else {
            return ""
        }
        return input
    }
    
    // 입력된 문자열에
    static func hasInvalidCharacter(in text: String) -> Bool {
        for unicode in text.unicodeScalars {
            if !self.invalidCharacters.contains(unicode) {
                return true
            }
        }
        return false
    }
}
