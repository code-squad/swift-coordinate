//
//  NumberParser.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 17..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct NumberParser {
    
    enum Error: Swift.Error {
        case parseFailed
        
        var localizedDescription: String {
            switch self {
            case .parseFailed:
                return "숫자 파싱에 실패하였습니다."
            }
        }
    }
    
    func parseNumbers(_ input: String) throws -> [Int] {
        let regex = "-?[0-9]+"
        let numbers = input.matches(for: regex)
        let parsedNumbers = numbers.compactMap { Int($0) }
        guard parsedNumbers.count == numbers.count else {
            throw Error.parseFailed
        }
        return parsedNumbers
    }
}
