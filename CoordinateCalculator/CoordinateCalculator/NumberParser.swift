//
//  NumberParser.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 17..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct NumberParser {
    
    private func checkRange(_ number: Int) -> Bool {
        return (0...24).contains(number)
    }
    
    func parseNumbers(_ input: String) -> [Int] {
        let regex = "-?[0-9]+"
        let numbers = input.matches(for: regex)
        return numbers.compactMap { Int($0) }.filter { checkRange($0) }
    }
}
