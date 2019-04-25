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

    static func isOutOfAxis(using numbers: (Int, Int)) -> Bool {
        let (x, y) = numbers
        return x > ANSICode.axis.AxisLimit || y > ANSICode.axis.AxisLimit || x < 0 || y < 0
    }
    
    static func isInAxis(using numbers: (Int, Int)) -> Bool {
        return !isOutOfAxis(using: numbers)
    }
}
