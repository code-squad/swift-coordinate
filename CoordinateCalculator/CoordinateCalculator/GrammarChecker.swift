//
//  GrammarChecker.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 16..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct GrammarChecker {
    
    let validCharacter = CharacterSet.init(charactersIn: "(),-").union(CharacterSet.decimalDigits)
    
    func checkInput(_ input: String) -> Bool {
        let check = input.components(separatedBy: validCharacter).filter{ $0 != "" }
        if check.count == 0 { return true }
        return false
    }
    
    func checkNumber(_ point: MyPoint) -> Bool {
        return point.x <= 24 && point.y <= 24
    }
    
    func checkMaxValue(_ value: [MyPoint]) -> Bool {
        var maxValue: Bool = true
        for index in 0..<value.count {
            guard checkNumber(value[index]) != false else{ maxValue = false; return false }
        }
        guard maxValue == true else { return false }
        return true
    }
}
