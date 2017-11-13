//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    func readInput() throws -> [MyPoint] {
        print("좌표를 입력하세요.", terminator: "\n")
        
        guard let inputValue = readLine() else {
            throw CoordinatesError.emptyValue
        }
        
        if inputValue == "q" || inputValue == "quit" {
            return []
        }
                
        return try Utility.splitInputValue(in: inputValue)
    }
}
