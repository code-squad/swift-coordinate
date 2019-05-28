//
//  NumberParser.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 17..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct NumberParser {
    
    func parse(_ input: String) -> [Int] {
        let regex = "-?[0-9]+"
        let numbers = input.matches(for: regex)
        let parsedNumbers = numbers.compactMap { Int($0) }
        return parsedNumbers
    }
}
