//
//  CoordinateValidator.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateValidator {
    static func isNil(point: (Int, Int)?) -> Bool {
        return point == nil
    }
    
    static func isOutOfAxis(using point: (Int, Int)) -> Bool {
        let (x, y) = point
        return x > ANSICode.axis.AxisLimit || y > ANSICode.axis.AxisLimit || x < 0 || y < 0
    }
    
    static func isInAxis(using point: (Int, Int)) -> Bool {
        return !isOutOfAxis(using: point)
    }
}
