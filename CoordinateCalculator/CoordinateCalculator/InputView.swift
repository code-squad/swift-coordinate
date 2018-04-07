//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 3. 30..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum Question: String {
    case coordinate = "좌표를 입력하세요.(ex: (1,1), 좌표범위: 1~24)"
}

struct InputView {
    
    let invalidCharacters: CharacterSet = CharacterSet(charactersIn: "1234567890,-()")
    
    static func readInput(question: String) -> String {
       print(question)
        guard let input = readLine() else {
            return ""
        }
        return input
    }
    
    func hasInvalidCharacter(in text: String) -> Bool {
        for unicode in text.unicodeScalars {
            guard self.invalidCharacters.contains(unicode) else {
                return true
            }
        }
        return false
    }
}
