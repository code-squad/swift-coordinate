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
        return input.contains("(") && input.contains(")") && input.count >= 5 && !input.isEmpty
    }

    static func isOutOfAxis(using numbers: [Int]) -> Bool {
        for num in numbers {
            if num > ANSICode.axis.AxisLimit || num < 0 { return true}
        }
        return false
    }
    
    static func isInAxis(using numbers: [Int]) -> Bool {
        return !isOutOfAxis(using: numbers)
    }
}
