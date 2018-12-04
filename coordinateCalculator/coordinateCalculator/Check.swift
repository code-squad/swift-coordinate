//
//  Check.swift
//  coordinateCalculator
//
//  Created by JINA on 03/12/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

// 사용자의 입력을 확인하여 MyPoint에 값 넘김
struct Check {
    static func checkInput(_ input: String) -> Bool {
        if input.contains("("), input.contains(")") {
            return true
        } else {
            return false
        }
    }
    
    static func getNum(_ input: String) -> MyPoint {
        var number = [String]()
        if checkInput(input) == true {
            number = (input.trimmingCharacters(in: CharacterSet.decimalDigits.inverted)).components(separatedBy: ",")
        }
        return MyPoint.init(x: Int(number[0])!, y: Int(number[1])!)
    }
}
