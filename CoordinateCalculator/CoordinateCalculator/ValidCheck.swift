//
//  ValidCheck.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ValidCheck {
    static private let maxRange = ANSICode.axis.AxisLimit
    static private let availableCharacters:[Character] = ["(",",",")","-","0","1","2","3","4","5","6","7","8","9"]
    
    static func rangeCheck(_ point:MyPoint) -> Bool {
        return point.x <= maxRange && point.y <= maxRange
    }
    
    static func characterCheck(_ input:String) -> Bool {
        for i in input {
            guard availableCharacters.contains(i) == true else {return false}
        }
        return true
    }
    
    static func numberOfHyphenCheck(_ input:String) -> Int {
        let hyphens = input.filter {$0 == "-"}
        return hyphens.count
    }
}
