//
//  ValidCheck.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ValidCheck {
    static private let availableCharacters:[Character] = ["(",",",")","-","0","1","2","3","4","5","6","7","8","9"]
    
    static func characterCheck(_ coordinate:String) -> Bool {
        for i in coordinate {
            guard availableCharacters.contains(i) == true else {return false}
        }
        return true
    }
    
    static func rangeCheck(_ points:[MyPoint]) -> Bool {
        for i in points {
            guard i.x <= ANSICode.axis.AxisLimit && i.y <= ANSICode.axis.AxisLimit else {return false}
        }
        return true
    }
}
