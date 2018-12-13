//
//  TextValidator.swift
//  CoordinateCalculator
//
//  Created by Elena on 04/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct TextValidator {
    private let minNumber: Int = 0
    private let maxNumber: Int = 24
    private let validCharacter = CharacterSet.init(charactersIn: "0123456789(),")
    
    private var text = String()
    
    init(text: String) {
        self.text = text
    }
    func isValidPoint() -> Bool {
        guard isValidCharacter() else { return false }
        guard isBrackets() else { return false }
        
        return true
    }
    
    private func isValidCharacter() -> Bool {
        return (text.rangeOfCharacter(from: validCharacter.inverted) == nil)
    }
    
    private func isBrackets() -> Bool {
        guard text.first == "(" , text.last == ")" else { return false }
        return true
    }
    
    func isRangePoint(num: Int) -> Bool {
        return (minNumber <= num && num <= maxNumber)
    }
    
}

