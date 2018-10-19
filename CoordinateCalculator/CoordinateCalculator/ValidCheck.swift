//
//  ValidCheck.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ValidCheck {
    static private let maxValue = ANSICode.axis.AxisLimit
    
    static func lengthCheck(point:MyPoint) -> Bool {
        return point.x <= maxValue && point.y <= maxValue
    }
}
