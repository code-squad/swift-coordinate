//
//  CoordinateValidator.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateValidator {
    static func isValidInputFormat(_ input: String) -> Bool {
        if input.isEmpty || input == "" { return false }
        
        let inputCharacterSet = CharacterSet.init(charactersIn: input)
        let formatCharacterSet = CharacterSet.init(charactersIn: "(,)-")
        let validCharacterSet = CharacterSet.decimalDigits.union(formatCharacterSet)
        
        let validCheck = inputCharacterSet.isSubset(of: validCharacterSet)
        return validCheck
    }

    static func isOutOfAxis(using pairs: [Pair]) -> Bool {
        for pair in pairs {
            if isOutOfAxis(using: pair.x) || isOutOfAxis(using: pair.y) {
                return true
            }
        }
        return false
    }
    
    static func isOutOfAxis(using num: Int) -> Bool {
        return num > ANSICode.axis.AxisLimit || num < 0
    }
    
    static func isInAxis(using pairs: [(x: Int, y: Int)]) -> Bool {
        return !isOutOfAxis(using: pairs)
    }
}
