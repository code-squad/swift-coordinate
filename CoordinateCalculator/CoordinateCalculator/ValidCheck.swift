//
//  ValidCheck.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {
    func isValidCharacter() -> Bool {
        return !isEmpty && range(of: "[^0-9(),-]", options: .regularExpression) == nil
    }
}

struct ValidCheck {
    static func rangeCheck(_ points:[MyPoint]) -> Bool {
        for i in points {
            guard i.x <= ANSICode.axis.AxisLimit && i.y <= ANSICode.axis.AxisLimit else {return false}
        }
        return true
    }
}
